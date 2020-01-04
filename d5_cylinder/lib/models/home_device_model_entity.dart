class HomeDeviceModelEntity {
	int bootstatus1;
	int bootstatus2;
	int bootstatus0;
	List<HomeDeviceModelWorkstatu> workstatus;

	HomeDeviceModelEntity({this.bootstatus1, this.bootstatus2, this.bootstatus0, this.workstatus});

	HomeDeviceModelEntity.fromJson(Map<String, dynamic> json) {
		bootstatus1 = json['bootstatus_1'];
		bootstatus2 = json['bootstatus_2'];
		bootstatus0 = json['bootstatus_0'];
		if (json['workstatus'] != null) {
			workstatus = new List<HomeDeviceModelWorkstatu>();(json['workstatus'] as List).forEach((v) { workstatus.add(new HomeDeviceModelWorkstatu.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bootstatus_1'] = this.bootstatus1;
		data['bootstatus_2'] = this.bootstatus2;
		data['bootstatus_0'] = this.bootstatus0;
		if (this.workstatus != null) {
      data['workstatus'] =  this.workstatus.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeDeviceModelWorkstatu {
	String rundate;
	int id;
	String message;

	HomeDeviceModelWorkstatu({this.rundate, this.id, this.message});

	HomeDeviceModelWorkstatu.fromJson(Map<String, dynamic> json) {
		rundate = json['rundate'];
		id = json['id'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rundate'] = this.rundate;
		data['id'] = this.id;
		data['message'] = this.message;
		return data;
	}
}
