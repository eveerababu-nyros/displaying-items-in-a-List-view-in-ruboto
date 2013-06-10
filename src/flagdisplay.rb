require 'ruboto/widget'
require 'ruboto/util/toast'





# http://xkcd.com/378/

class Flagdisplay
  def onCreate(bundle)
    super
    set_title 'Country Flag'
	self.setContentView(Ruboto::R::layout::flag_display)
	imgview = findViewById(Ruboto::R::id::photo)
	intent = getIntent()
	imgvalue = intent.getStringExtra('photoname')
	case imgvalue
		when "India"
			imgview.setImageResource(Ruboto::R::drawable::india);
		when "Srilanka"
			imgview.setImageResource(Ruboto::R::drawable::srilanka);
		when "Bangladesh"
			imgview.setImageResource(Ruboto::R::drawable::bangladesh);
		when "Pakistan"
			imgview.setImageResource(Ruboto::R::drawable::pakistan);
		when "Nepal"
			imgview.setImageResource(Ruboto::R::drawable::nepal);
		when "South Africa"
			imgview.setImageResource(Ruboto::R::drawable::south_africa);
		when "England"
			imgview.setImageResource(Ruboto::R::drawable::england);
		when "USA"
			imgview.setImageResource(Ruboto::R::drawable::american);
		when "West Indies"
			imgview.setImageResource(Ruboto::R::drawable::west);
		when "Newzeland"
			imgview.setImageResource(Ruboto::R::drawable::newzeland);
		when "Japan"
			imgview.setImageResource(Ruboto::R::drawable::japan);
		when "South Korea"
			imgview.setImageResource(Ruboto::R::drawable::southkorea);
		when "Australia"
			imgview.setImageResource(Ruboto::R::drawable::australia);
		else
			puts "Wrong one Choosen"
	end
		btnback = findViewById(Ruboto::R::id::btn_back)
		btnback.setOnClickListener(OnClickListener.new(self))
  end
  
end

class OnClickListener
	def initialize(activity)
		@activity = activity
	end
	
	def onClick(view)
		intent = android.content.Intent.new('android.intent.action.MAIN')
		intent.addFlags(android.content.Intent::FLAG_ACTIVITY_CLEAR_TASK|android.content.Intent::FLAG_ACTIVITY_NEW_TASK);  
		@activity.startActivity(intent)
		@activity.finish()
	end
end
