xml.instruct!  # <?xml version="1.0" encoding="UTF-8"?>

xml.SnomIPPhoneMenu {
	xml.Title("Call Forwarding - #{@sip_account_name}")
	xml.MenuItem {
		xml.Name("Unconditional - #{@always_destination}")
		xml.URL("#{@provisioning_server_url}/call_forwarding/always.xml")
	}
	xml.MenuItem {
		xml.Name("Assistant - #{@assistant_destination}")
		xml.URL("#{@provisioning_server_url}/call_forwarding/assistant.xml")
	}
	xml.MenuItem {
		xml.Name("If busy - #{@busy_destination}")
		xml.URL("#{@provisioning_server_url}/call_forwarding/busy.xml")
	}
	xml.MenuItem {
		xml.Name("If not answered - #{@noanswer_destination}")
		xml.URL("#{@provisioning_server_url}/call_forwarding/noanswer.xml")
	}
	xml.MenuItem {
		xml.Name("If offline - #{@offline_destination}")
		xml.URL("#{@provisioning_server_url}/call_forwarding/offline.xml")
	}
	xml.SoftKeyItem {
		xml.Name('*')
		xml.URL("#{@provisioning_server_url}/xml_menu.xml")
	}
}


# Local Variables:
# mode: ruby
# End:
