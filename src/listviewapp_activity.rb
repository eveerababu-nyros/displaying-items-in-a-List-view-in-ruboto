require 'ruboto/widget'
require 'ruboto/util/toast'

java_import "java.util.ArrayList"
java_import "java.util.Arrays"

java_import "android.os.Bundle"
java_import "android.widget.ArrayAdapter"
java_import "android.widget.ListView"
java_import "java.lang.String"




  

# http://xkcd.com/378/

class ListviewappActivity
  def onCreate(bundle)
    super
    set_title 'Country Names'
	self.setContentView(Ruboto::R::layout::get_ruboto_core)
	lv = findViewById(Ruboto::R::id::mainListView)
	values = ["India", "Srilanka", "Bangladesh", "Pakistan", "Nepal", "South Africa", "England", "USA", "West Indies", "Newzeland", "Japan", "South Korea"]
	countrylist = ArrayList.new
		for i in 0...values.length do
			countrylist.add values[i]
		end
	listadapter = ArrayAdapter.new(self, Ruboto::R::layout::list_item, countrylist)
	
		#Adding one more list
	listadapter.add("Australia")
	lv.setAdapter(listadapter)
	lv.setOnItemClickListener(OnItemClickListener.new(self))
  end
end


class OnItemClickListener

	def initialize(activity)
		@activity = activity
	end
	
	def onItemClick(lv, view, position, id)
		
			countryname = lv.getItemAtPosition(position)
			intent = android.content.Intent.new('android.intent.action.FLAGDISPLAY')
			intent.putExtra('photoname', countryname)
			@activity.startActivity(intent)	    
	end 
end
