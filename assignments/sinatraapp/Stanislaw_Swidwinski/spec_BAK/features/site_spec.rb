require_relative '../spec_helper'

# overall describe block
describe 'Sinatra test' do

	# set up the tests to use the Rack::Test MockResponse body as the subject of mosts tests
	subject { last_response.body }

	# general design tests - shared examples for all pages to look for specific template features (in this case, navigation links, but can be designed for arbitrary templates)
	shared_examples_for 'all pages' do
		it { should have_link('Home', href: '/') }
		it { should have_link('Sets', href: '/sets') }
	end

	# new page with error tests - shared examples for cases where a link was called with an invalid set name so we redirected to the new set page w/ an error message and the invalid name filled in (again, can be modified for specific design / error functionality)
	shared_examples_for 'new page with error' do
		it { should have_selector('h1', text: 'Create New Set') }
		it { should have_selector("input[value='pants']") }
		it { should have_selector("span[class='error']", text: 'invalid set') }
	end

	# tests for the home page
	describe 'home page', type: :feature do

		# before all tests, issue a GET request to '/'
		before { get '/' }

		# test to make sure it satisfies general template requirements
		it_behaves_like 'all pages'

		# here we could add more tests for specific home page features
	end

	describe 'sets page', type: :feature do

		# before all tests, issue a GET request to '/sets'
		before { get '/sets' }

		# test to make sure it satisfies general template requirements
		it_behaves_like 'all pages'
		# look for title selector with specific text
		it { should have_selector('h1', text: 'Sets') }

		# add a sub-context where we check to make sure it shows existing sets (we're using Rack::Tests for this since we need to modify the session)
		context 'with existing sets' do
			# before this block of tests, create a set in the Rack::Test session named 'pants'
			before { define_set_in_session('pants') }
			# test that the set is displayed on the page
			it 'should show the set' do
				# issue a GET request to '/sets'
				get '/sets'
				# check for td selector with the set name in it
				subject.should have_selector('td', text: 'pants')
				# check for view link with valid destination
				subject.should have_link('View', href:'/sets/pants')
			end
		end
	end

	# USING CAPYBARA - more user-focused integration testing
	# not ideal because this means we can't use redirects and we're not actually testing that the session changes...
	describe 'new set page', type: :feature do

		# change the subject in this block to the Capybara page object
		subject { page }
		# visit the page at '/sets/new'
		before { visit '/sets/new' }

		# check for template stuff
		it_behaves_like 'all pages'
		# check for title
		it { should have_selector('h1', text: 'Create New Set')}

		# first, if we have valid information in the form
		context 'with valid information' do
			# first, fill in the form with both name and a comma-separated list
			before do
				# fill in the text input named 'name' with 'pants'
				fill_in 'name', with: 'pants'
				# fill in the text input named 'vidnums' with 'foo, bar, baz'
				fill_in 'vidnums', with: 'foo, bar, baz'
			end
			# check the that the set page renders implying that we went through the right steps
			it 'should save' do
				# click on the button named 'Create'
				click_button 'Create'
				# check for title with set name
				subject.should have_selector('h1', text: 'pants')
				# check for td selector with vidnum array
				subject.should have_selector('td', text: '["foo", "bar", "baz"]')
				# check for link to edit page with valid target
				subject.should have_link('Edit', href: '/sets/pants/edit')
			end
		end

		# check to make sure that leaving the set name blank will fail
		context 'with no set name' do
			# first, just fill in the vidnums filed
			before { fill_in 'vidnums', with: 'foo, bar, buzz' }
			# check that it does not save by looking for the new page header and an error message
			it 'should not save' do
				# click on the button named 'Create'
				click_button 'Create'
				# check that the page has the new page header
				subject.should have_selector('h1', text: 'Create New Set')
				# check that the page has the error element with the appropriate test (can be modified for different error behavior)
				subject.should have_selector("span[class='error']", text: 'invalid parameters')
			end
		end

		# check to make sure that leaving the vidnums field blank will fail
		context 'with no links' do
			# first, just fill in the name field
			before { fill_in 'name', with: 'pants' }
			# check that it does not save by looking for the new page header and an error message
			it 'should not save' do
				# click on the button named 'Create'
				click_button 'Create'
				# check that the page has the new page header
				subject.should have_selector('h1', text: 'Create New Set')
				# check that the page has the error element with the appropriate test
				subject.should have_selector("span[class='error']", text: 'invalid parameters')
			end
		end
	end

	# USING RACK::TEST
	# now we can test whether or not the session is modified with the form by testing the Rack server directly
	describe '#create method', type: :feature do

		# define a variable for this block representing the Rack::Test session
		let(:session) { last_request.env['rack.session'] }

		# first, check for valid submission parameters
		context 'with valid parameters' do
			# issue a POST request to '/sets/new' with a valid params hash and an initially empty session
			before do
				post '/sets/new', { name: 'pants', vidnums: 'foo, bar, baz' }, { 'rack.session' => { sets: { } } }
			end
			# check that the session updates by testing it against the expected session
			it 'should update the session' do
				# we issue a GET request to '/sets' to update last_request
				get '/sets'
				# check that the current session equals the expected session
				expect(session[:sets]).to eq({ "pants" => { name: 'pants', vidnums: ['foo', 'bar', 'baz'] } })
			end
		end

		# check for an invalid name in the params hash
		context 'with invalid name' do
			# issue a POST request to '/sets/new' with an invalid params hash (empty name) and an initially empty session
			before do
				post '/sets/new', { name: '', vidnums: 'foo, bar, baz' }, { 'rack.session' => { sets: { } } }
			end
			# check that the session isn't updated by asserting that it remains empty after a subsequent request
			it 'should not update the session' do
				# issue a GET request to '/sets/new' to update last_request
				get '/sets'
				# check that the current session remains empty
				expect(session[:sets]).to eq({ })
			end
		end

		# check for an invalid vidnums in the params hash
		context 'with invalid vidnums' do
			# issue a POST request to '/sets/new' with an invalid params hash (empty vidnums) and an initially empty session
			before do
				post '/sets/new', { name: 'pants', vidnums: '' }, { 'rack.session' => { sets: { } } }
			end
			# check that the session isn't updated by asserting that it remains empty after a subsequent request
			it 'should not update the session' do
				# issue a GET request to '/sets/new' to update last_request
				get '/sets'
				# check that the current session remains empty
				expect(session[:sets]).to eq({ })
			end
		end
	end

	describe 'show set page', type: :feature do
		# check that the show set page functions when a set exists
		context 'with existing set' do
			# before all tests create a set named 'pants' and issue a GET request to '/sets/pants'
			before do
				define_set_in_session('pants')
				get '/sets/pants'
			end
			# check for template features
			it_behaves_like 'all pages'
			# check that the set name is the title
			it 'should display the set name as a title' do
				subject.should have_selector('h1', text: 'pants')
			end
			# check that all the links exist and have valid targets
			it 'should have edit, play, and delete links' do
				subject.should have_link('Edit', href: '/sets/pants/edit')
				subject.should have_link('Play', href: '/sets/pants/play')
				subject.should have_link('Delete', href:'/sets/pants/delete')
			end
		end

		# check that the show set page redirects to the new set page with an error and the name field filled in
		context 'without existing set' do
			# before, issue a GET request to '/sets/pants' with no existing set
			before { get '/sets/pants' }
			# check for template features
			it_behaves_like 'all pages'
			# check for new set page with error and name field filled in
			it_behaves_like 'new page with error'
		end
	end

	# USING RACK::TEST
	# we can only test the existence of the edit page for an existing set; however, since we can't access the session using Capybara, we can't run through the edit set form since there will be no existing sets
	describe 'edit set page', type: :feature do

		# check that the edit link works when a set exists
		context 'with existing set' do
			# before all tests create a set named 'pants' and issue a GET request to '/sets/pants/edit'
			before do
				define_set_in_session('pants', ['foo', 'bar', 'baz'])
				get '/sets/pants/edit'
			end

			# check for template features
			it_behaves_like 'all pages'
			# check for valid title
			it { should have_selector('h1', text: 'Edit pants') }
			# check that form has the existing name filled in to an input field with the name 'name'
			it { should have_selector("input[name='name'][value='pants']") }
			# check that form has the current video numbers filled in to an input field with the name 'vidnums'
			it { should have_selector("input[name='vidnums'][value='foo, bar, baz']") }
		end

		# check that the edit set page redirects to the new set page with an error and the name field filled in (see above)
		context 'without existing set' do
			before { get '/sets/pants/edit' }
			it_behaves_like 'all pages'
			it_behaves_like 'new page with error'
		end
	end

	# test the #update method specifically
	describe '#update method', type: :feature do

		# define a variable for this block representing the Rack::Test session
		let(:session) { last_request.env['rack.session'] }

		# check the #update method when the set specified in the PUT target exists
		context 'with existing set' do

			# before each test, define the set in the MockRequest session
			before { define_set_in_session('pants', ['foo', 'bar', 'baz']) }

			# first, test for valid request parameters
			describe 'with valid information' do
				# check the functionality when the name is unchanged
				describe 'with same name' do
					# issue a PUT request to '/set/pants' with the same name but different vidnums
					before { put '/sets/pants', { name: 'pants', vidnums: 'one, two, three' } }
					# check that the session is updated with the new vidnums
					it 'should update the session' do
						expect(session[:sets]).to eq({ "pants" => { name: 'pants', vidnums: ['one', 'two', 'three'] } })
					end
					# check that the method brings you back to the show page with the new vidnums displaying correctly
					it 'should show the new information' do
						subject.should have_selector('h1', text: 'pants')
						subject.should have_link('Edit', href: '/sets/pants/edit')
						subject.should have_selector('td', text: '["one", "two", "three"]')
					end
				end

				# check the functionality when the name is changed
				describe 'with different name' do
					# issue a PUT request to '/set/pants' with a different name and different vidnums
					before { put '/sets/pants', { name: 'fizzbuzz', vidnums: 'one, two, three' } }
					# check that the session is updated with the new set information and that the old set is deleted from the hash
					it 'should update the session' do
						expect(session[:sets]).to eq({ "fizzbuzz" => { name: 'fizzbuzz', vidnums: ['one', 'two', 'three'] } })
					end
					# check that the method brings you back to the show page with the new name and vidnums (also note that we're checking the target of the 'Edit' link for a new path)
					it 'should show the new information' do
						subject.should have_selector('h1', text: 'fizzbuzz')
						subject.should have_link('Edit', href: '/sets/fizzbuzz/edit')
						subject.should have_selector('td', text: '["one", "two", "three"]')
					end
					# check that issuing a GET request to the old show page redirects you to the new set page w/ an error
					describe 'should not keep the old path' do
						before { get '/sets/pants' }
						it_behaves_like 'new page with error'
					end
				end
			end

			# test for invalid request parameters
			describe 'with invalid information' do

				# check for PUT requests with an invalid name
				describe 'with invalid name' do
					# issue a PUT request to '/set/pants' with an invalid name and different vidnums
					before { put '/sets/pants', { name: '', vidnums: 'one, two, three' } }
					# check that the session does not change
					it 'should not update the session' do
						expect(session[:sets]).to eq({ "pants" => { name: 'pants', vidnums: ['foo', 'bar', 'baz'] } })
					end
					# check that we are redirected to the edit page with an error message
					it 'should show the old information with error' do
						subject.should have_selector('h1', text: 'Edit pants')
						subject.should have_selector("span[class='error']", text: 'invalid parameters')
						subject.should have_selector("input[value='pants']")
						subject.should have_selector("input[value='foo, bar, baz']")
					end
				end

				# check for PUT requests with invalid vidnums
				describe 'with invalid vidnums' do
					# issue a PUT request to '/set/pants' with an invalid name and different vidnums
					before { put '/sets/pants', { name: 'pants', vidnums: '' } }
					# check that the session does not change
					it 'should not update the session' do
						expect(session[:sets]).to eq({ "pants" => { name: 'pants', vidnums: ['foo', 'bar', 'baz'] } })
					end
					# check that we are redirected to the edit page with an error message
					it 'should show the old information with error' do
						subject.should have_selector('h1', text: 'Edit pants')
						subject.should have_selector("span[class='error']", text: 'invalid parameters')
						subject.should have_selector("input[value='pants']")
						subject.should have_selector("input[value='foo, bar, baz']")
					end
				end
			end
		end

		# check that the #update request redirects to the new set page with an error and the name field filled in (see above)
		context 'without existing set' do
			before { put '/sets/pants' }
			it_behaves_like 'all pages'
			it_behaves_like 'new page with error'
		end
	end

	# test the play functionality
	describe 'play set page', type: :feature do

		# check that it works when the set exists
		context 'with existing set' do
			# first, create a set with valid video numbers (not sure that this is necessary), then issue a GET request to '/sets/pants/play'
			before do
				define_set_in_session('pants', ['X3AJcgfopdk', 'X3AJcgfopdk', 'X3AJcgfopdk'])
				get '/sets/pants/play'
			end
			# check that it plays a video
			it 'plays a video' do
				# look for a param element named 'movie'
				subject.should have_selector("param[name='movie']")
				# check for an embedded flash video with the correct src attribute
				subject.should have_selector("embed[type='application/x-shockwave-flash'][src='http://www.youtube.com/v/X3AJcgfopdk&autoplay=1']")
			end
		end

		# check that the play request redirects to the new set page with an error and the name field filled in (see above)
		context 'without existing set' do
			before { get '/sets/pants/play' }
			it_behaves_like 'all pages'
			it_behaves_like 'new page with error'
		end
	end

	# test the delete page
	describe 'delete page', type: :feature do

		# check that it works when the set exists
		context 'with existing set' do
			# first, create two sets in the session, one named 'pants' and one named 'fizzbuzz', and issue a GET request to '/sets/pants/delete'
			before do
				define_set_in_session('pants')
				get '/sets/pants/delete'
			end
			# check for template features
			it_behaves_like 'all pages'
			# look for specific feature from the delete page (title and form button)
			it 'displays the delete page' do
				subject.should have_selector('h1', 'Delete pants')
				subject.should have_selector("input[value='Delete']")
			end
		end

		# check that without an existing set it redirects to the sets index with an error message
		context 'without existing sets' do
			# just issue a GET request to 'sets/pants/delete' without creating the 'pants' set
			before { get '/sets/pants/delete' }
			# check for template features
			it_behaves_like 'all pages'
			# check for error and index page title
			it 'displays the sets index with error' do
				subject.should have_selector("span[class='error']", text: 'invalid set')
				subject.should have_selector('h1', text: 'Sets')
			end
		end
	end

	# test the #destroy method
	describe '#destroy method', type: :feature do

		# define a variable for this block representing the Rack::Test session
		let(:session) { last_request.env['rack.session'] }

		# first, test for an existing set
		context 'with existing set' do
			# first, create two sets, one named 'pants' and one named 'fizzbuzz', then issue a DELETE request to '/sets/pants'
			before do
				define_sets_in_session('pants', 'fizzbuzz')
				delete '/sets/pants'
			end
			# check that the set is removed from the session
			it 'modifies the session' do
				expect(session[:sets]).to eq({ "fizzbuzz" => { name: 'fizzbuzz', vidnums: ['a', 'b', 'c'] } })
			end
			# check that it redirects you to the set index without the deleted set's information
			it_behaves_like 'all pages'
			it 'displays the sets index' do
				subject.should have_selector('h1', text: 'Sets')
				subject.should have_content('fizzbuzz')
				subject.should_not have_content('pants')
			end
		end

		# test that without an existing set that the request simply redirects you to the set index page with an error message
		context 'without existing sets' do
			before do
				delete '/sets/pants'
			end
			it_behaves_like 'all pages'
			it 'displays the sets index with error' do
				subject.should have_selector("span[class='error']", text: 'invalid set')
				subject.should have_selector('h1', text: 'Sets')
			end
		end
	end
end

# helpers

# create a set in the Rack::Test MockSession (allows for the vidnums parameter to be missing)
def define_set_in_session(name, vidnums=['a','b','c'])
	get '/', {}, { 'rack.session' => { "sets" => { "#{name}" => { :name => "#{name}", :vidnums => ["#{vidnums[0]}", "#{vidnums[1]}", "#{vidnums[2]}"] } } } }
end

# create two sets in the Rack::Test MockSession
def define_sets_in_session(name1, name2)
	get '/', {}, { 'rack.session' => { "sets" => { "#{name1}" => { :name => "#{name1}", :vidnums => ["a", "b", "c"] }, "#{name2}" => { :name => "#{name2}", :vidnums => ["a", "b", "c"] } } } }
end