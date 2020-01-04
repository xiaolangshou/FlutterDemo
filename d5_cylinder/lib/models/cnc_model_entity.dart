class CncModelEntity {
	CncModelCnc15 cNC15;
	CncModelCnc01 cNC01;
	CncModelCnc02 cNC02;
	CncModelCnc14 cNC14;

	CncModelEntity({this.cNC15, this.cNC01, this.cNC02, this.cNC14});

	CncModelEntity.fromJson(Map<String, dynamic> json) {
		cNC15 = json['CNC15'] != null ? new CncModelCnc15.fromJson(json['CNC15']) : null;
		cNC01 = json['CNC01'] != null ? new CncModelCnc01.fromJson(json['CNC01']) : null;
		cNC02 = json['CNC02'] != null ? new CncModelCnc02.fromJson(json['CNC02']) : null;
		cNC14 = json['CNC14'] != null ? new CncModelCnc14.fromJson(json['CNC14']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.cNC15 != null) {
      data['CNC15'] = this.cNC15.toJson();
    }
		if (this.cNC01 != null) {
      data['CNC01'] = this.cNC01.toJson();
    }
		if (this.cNC02 != null) {
      data['CNC02'] = this.cNC02.toJson();
    }
		if (this.cNC14 != null) {
      data['CNC14'] = this.cNC14.toJson();
    }
		return data;
	}
}

class CncModelCnc15 {
	String devid;
	int currentprognum;
	List<CncModelCnc15Feedspeeddata> feedspeeddata;
	int acqtime;
	int mainprognum;
	int seqnum;
	double uTI;
	String cycletime;
	CncModelCnc15Mac mac;
	CncModelCnc15Dis dis;
	String cncruntime;
	int spindleRealSpeed;
	int spindlespeed;
	CncModelCnc15Rel rel;
	String spload;
	int partcount;
	String cncpowerontime;
	List<CncModelCnc15Daycount> daycount;
	int totalcount;
	dynamic cncworkratio;
	List<String> tooldata;
	int servRealSpeedX;
	CncModelCnc15Otherdata otherData;
	int reqcount;
	dynamic progworkratio;
	String svload;
	int spindleCmdSpeed;
	CncModelCnc15SpindleCurrent spindleCurrent;
	int spindlecount;
	CncModelCnc15Abs abs;
	String cnccuttingtime;
	List<CncModelCnc15Hourcount> hourcount;
	int feedspeed;
	String alarmtime;
	double servSpeedRate;
	CncModelCnc15SpindleTemp spindleTemp;
	int toolNum;
	double spindleSpeedRate;
	int servoCmdSpeed;

	CncModelCnc15({this.devid, this.currentprognum, this.feedspeeddata, this.acqtime, this.mainprognum, this.seqnum, this.uTI, this.cycletime, this.mac, this.dis, this.cncruntime, this.spindleRealSpeed, this.spindlespeed, this.rel, this.spload, this.partcount, this.cncpowerontime, this.daycount, this.totalcount, this.cncworkratio, this.tooldata, this.servRealSpeedX, this.otherData, this.reqcount, this.progworkratio, this.svload, this.spindleCmdSpeed, this.spindleCurrent, this.spindlecount, this.abs, this.cnccuttingtime, this.hourcount, this.feedspeed, this.alarmtime, this.servSpeedRate, this.spindleTemp, this.toolNum, this.spindleSpeedRate, this.servoCmdSpeed});

	CncModelCnc15.fromJson(Map<String, dynamic> json) {
		devid = json['devid'];
		currentprognum = json['currentprognum'];
		if (json['feedspeeddata'] != null) {
			feedspeeddata = new List<CncModelCnc15Feedspeeddata>();(json['feedspeeddata'] as List).forEach((v) { feedspeeddata.add(new CncModelCnc15Feedspeeddata.fromJson(v)); });
		}
		acqtime = json['acqtime'];
		mainprognum = json['mainprognum'];
		seqnum = json['seqnum'];
		uTI = json['UTI'];
		cycletime = json['cycletime'];
		mac = json['mac'] != null ? new CncModelCnc15Mac.fromJson(json['mac']) : null;
		dis = json['dis'] != null ? new CncModelCnc15Dis.fromJson(json['dis']) : null;
		cncruntime = json['cncruntime'];
		spindleRealSpeed = json['spindle_real_speed'];
		spindlespeed = json['spindlespeed'];
		rel = json['rel'] != null ? new CncModelCnc15Rel.fromJson(json['rel']) : null;
		spload = json['spload'];
		partcount = json['partcount'];
		cncpowerontime = json['cncpowerontime'];
		if (json['daycount'] != null) {
			daycount = new List<CncModelCnc15Daycount>();(json['daycount'] as List).forEach((v) { daycount.add(new CncModelCnc15Daycount.fromJson(v)); });
		}
		totalcount = json['totalcount'];
		cncworkratio = json['cncworkratio'];
		tooldata = json['tooldata']?.cast<String>();
		servRealSpeedX = json['serv_real_speed_x'];
		otherData = json['otherData'] != null ? new CncModelCnc15Otherdata.fromJson(json['otherData']) : null;
		reqcount = json['reqcount'];
		progworkratio = json['progworkratio'];
		svload = json['svload'];
		spindleCmdSpeed = json['spindle_cmd_speed'];
		spindleCurrent = json['spindle_current'] != null ? new CncModelCnc15SpindleCurrent.fromJson(json['spindle_current']) : null;
		spindlecount = json['spindlecount'];
		abs = json['abs'] != null ? new CncModelCnc15Abs.fromJson(json['abs']) : null;
		cnccuttingtime = json['cnccuttingtime'];
		if (json['hourcount'] != null) {
			hourcount = new List<CncModelCnc15Hourcount>();(json['hourcount'] as List).forEach((v) { hourcount.add(new CncModelCnc15Hourcount.fromJson(v)); });
		}
		feedspeed = json['feedspeed'];
		alarmtime = json['alarmtime'];
		servSpeedRate = json['serv_speed_rate'];
		spindleTemp = json['spindle_temp'] != null ? new CncModelCnc15SpindleTemp.fromJson(json['spindle_temp']) : null;
		toolNum = json['tool_num'];
		spindleSpeedRate = json['spindle_speed_rate'];
		servoCmdSpeed = json['servo_cmd_speed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['devid'] = this.devid;
		data['currentprognum'] = this.currentprognum;
		if (this.feedspeeddata != null) {
      data['feedspeeddata'] =  this.feedspeeddata.map((v) => v.toJson()).toList();
    }
		data['acqtime'] = this.acqtime;
		data['mainprognum'] = this.mainprognum;
		data['seqnum'] = this.seqnum;
		data['UTI'] = this.uTI;
		data['cycletime'] = this.cycletime;
		if (this.mac != null) {
      data['mac'] = this.mac.toJson();
    }
		if (this.dis != null) {
      data['dis'] = this.dis.toJson();
    }
		data['cncruntime'] = this.cncruntime;
		data['spindle_real_speed'] = this.spindleRealSpeed;
		data['spindlespeed'] = this.spindlespeed;
		if (this.rel != null) {
      data['rel'] = this.rel.toJson();
    }
		data['spload'] = this.spload;
		data['partcount'] = this.partcount;
		data['cncpowerontime'] = this.cncpowerontime;
		if (this.daycount != null) {
      data['daycount'] =  this.daycount.map((v) => v.toJson()).toList();
    }
		data['totalcount'] = this.totalcount;
		data['cncworkratio'] = this.cncworkratio;
		data['tooldata'] = this.tooldata;
		data['serv_real_speed_x'] = this.servRealSpeedX;
		if (this.otherData != null) {
      data['otherData'] = this.otherData.toJson();
    }
		data['reqcount'] = this.reqcount;
		data['progworkratio'] = this.progworkratio;
		data['svload'] = this.svload;
		data['spindle_cmd_speed'] = this.spindleCmdSpeed;
		if (this.spindleCurrent != null) {
      data['spindle_current'] = this.spindleCurrent.toJson();
    }
		data['spindlecount'] = this.spindlecount;
		if (this.abs != null) {
      data['abs'] = this.abs.toJson();
    }
		data['cnccuttingtime'] = this.cnccuttingtime;
		if (this.hourcount != null) {
      data['hourcount'] =  this.hourcount.map((v) => v.toJson()).toList();
    }
		data['feedspeed'] = this.feedspeed;
		data['alarmtime'] = this.alarmtime;
		data['serv_speed_rate'] = this.servSpeedRate;
		if (this.spindleTemp != null) {
      data['spindle_temp'] = this.spindleTemp.toJson();
    }
		data['tool_num'] = this.toolNum;
		data['spindle_speed_rate'] = this.spindleSpeedRate;
		data['servo_cmd_speed'] = this.servoCmdSpeed;
		return data;
	}
}

class CncModelCnc15Feedspeeddata {
	int count;
	String time;

	CncModelCnc15Feedspeeddata({this.count, this.time});

	CncModelCnc15Feedspeeddata.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		time = json['time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['time'] = this.time;
		return data;
	}
}

class CncModelCnc15Mac {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc15Mac({this.x, this.y, this.z, this.da});

	CncModelCnc15Mac.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc15Dis {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc15Dis({this.x, this.y, this.z, this.da});

	CncModelCnc15Dis.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc15Rel {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc15Rel({this.x, this.y, this.z, this.da});

	CncModelCnc15Rel.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc15Daycount {
	int count;
	String day;

	CncModelCnc15Daycount({this.count, this.day});

	CncModelCnc15Daycount.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		day = json['day'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['day'] = this.day;
		return data;
	}
}

class CncModelCnc15Otherdata {
	String mstbmode;
	String runstatus;
	String cncType;
	String motion;
	String edit;
	String axes;
	String emergency;
	String version;
	String dummy;
	String isalarm;
	String alarmMes;
	String alarmType;
	int maxAxis;
	String series;
	String mtType;
	String tmmode;
	String autmode;
	String addinfo;

	CncModelCnc15Otherdata({this.mstbmode, this.runstatus, this.cncType, this.motion, this.edit, this.axes, this.emergency, this.version, this.dummy, this.isalarm, this.alarmMes, this.alarmType, this.maxAxis, this.series, this.mtType, this.tmmode, this.autmode, this.addinfo});

	CncModelCnc15Otherdata.fromJson(Map<String, dynamic> json) {
		mstbmode = json['mstbmode'];
		runstatus = json['runstatus'];
		cncType = json['cnc_type'];
		motion = json['motion'];
		edit = json['edit'];
		axes = json['axes'];
		emergency = json['emergency'];
		version = json['version'];
		dummy = json['dummy'];
		isalarm = json['isalarm'];
		alarmMes = json['alarm_mes'];
		alarmType = json['alarm_type'];
		maxAxis = json['max_axis'];
		series = json['series'];
		mtType = json['mt_type'];
		tmmode = json['tmmode'];
		autmode = json['autmode'];
		addinfo = json['addinfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mstbmode'] = this.mstbmode;
		data['runstatus'] = this.runstatus;
		data['cnc_type'] = this.cncType;
		data['motion'] = this.motion;
		data['edit'] = this.edit;
		data['axes'] = this.axes;
		data['emergency'] = this.emergency;
		data['version'] = this.version;
		data['dummy'] = this.dummy;
		data['isalarm'] = this.isalarm;
		data['alarm_mes'] = this.alarmMes;
		data['alarm_type'] = this.alarmType;
		data['max_axis'] = this.maxAxis;
		data['series'] = this.series;
		data['mt_type'] = this.mtType;
		data['tmmode'] = this.tmmode;
		data['autmode'] = this.autmode;
		data['addinfo'] = this.addinfo;
		return data;
	}
}

class CncModelCnc15SpindleCurrent {
	int servoCurrentY;
	int servoCurrentX;
	int servoCurrentZ;
	int spindleCurrent;

	CncModelCnc15SpindleCurrent({this.servoCurrentY, this.servoCurrentX, this.servoCurrentZ, this.spindleCurrent});

	CncModelCnc15SpindleCurrent.fromJson(Map<String, dynamic> json) {
		servoCurrentY = json['servo_current_y'];
		servoCurrentX = json['servo_current_x'];
		servoCurrentZ = json['servo_current_z'];
		spindleCurrent = json['spindle_current'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_current_y'] = this.servoCurrentY;
		data['servo_current_x'] = this.servoCurrentX;
		data['servo_current_z'] = this.servoCurrentZ;
		data['spindle_current'] = this.spindleCurrent;
		return data;
	}
}

class CncModelCnc15Abs {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc15Abs({this.x, this.y, this.z, this.da});

	CncModelCnc15Abs.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc15Hourcount {
	String hour;
	int count;

	CncModelCnc15Hourcount({this.hour, this.count});

	CncModelCnc15Hourcount.fromJson(Map<String, dynamic> json) {
		hour = json['hour'];
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hour'] = this.hour;
		data['count'] = this.count;
		return data;
	}
}

class CncModelCnc15SpindleTemp {
	int servoTempY;
	int spindleTemp;
	int servoTempZ;
	int servoTempX;

	CncModelCnc15SpindleTemp({this.servoTempY, this.spindleTemp, this.servoTempZ, this.servoTempX});

	CncModelCnc15SpindleTemp.fromJson(Map<String, dynamic> json) {
		servoTempY = json['servo_temp_y'];
		spindleTemp = json['spindle_temp'];
		servoTempZ = json['servo_temp_z'];
		servoTempX = json['servo_temp_x'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_temp_y'] = this.servoTempY;
		data['spindle_temp'] = this.spindleTemp;
		data['servo_temp_z'] = this.servoTempZ;
		data['servo_temp_x'] = this.servoTempX;
		return data;
	}
}

class CncModelCnc01 {
	String devid;
	int currentprognum;
	List<CncModelCnc01Feedspeeddata> feedspeeddata;
	int acqtime;
	int mainprognum;
	int seqnum;
	double uTI;
	String cycletime;
	CncModelCnc01Mac mac;
	CncModelCnc01Dis dis;
	String cncruntime;
	int spindleRealSpeed;
	int spindlespeed;
	CncModelCnc01Rel rel;
	String spload;
	int partcount;
	String cncpowerontime;
	List<CncModelCnc01Daycount> daycount;
	int totalcount;
	dynamic cncworkratio;
	List<String> tooldata;
	int servRealSpeedX;
	CncModelCnc01Otherdata otherData;
	int reqcount;
	dynamic progworkratio;
	String svload;
	int spindleCmdSpeed;
	CncModelCnc01SpindleCurrent spindleCurrent;
	int spindlecount;
	CncModelCnc01Abs abs;
	String cnccuttingtime;
	List<CncModelCnc01Hourcount> hourcount;
	int feedspeed;
	String alarmtime;
	double servSpeedRate;
	CncModelCnc01SpindleTemp spindleTemp;
	int toolNum;
	double spindleSpeedRate;
	int servoCmdSpeed;

	CncModelCnc01({this.devid, this.currentprognum, this.feedspeeddata, this.acqtime, this.mainprognum, this.seqnum, this.uTI, this.cycletime, this.mac, this.dis, this.cncruntime, this.spindleRealSpeed, this.spindlespeed, this.rel, this.spload, this.partcount, this.cncpowerontime, this.daycount, this.totalcount, this.cncworkratio, this.tooldata, this.servRealSpeedX, this.otherData, this.reqcount, this.progworkratio, this.svload, this.spindleCmdSpeed, this.spindleCurrent, this.spindlecount, this.abs, this.cnccuttingtime, this.hourcount, this.feedspeed, this.alarmtime, this.servSpeedRate, this.spindleTemp, this.toolNum, this.spindleSpeedRate, this.servoCmdSpeed});

	CncModelCnc01.fromJson(Map<String, dynamic> json) {
		devid = json['devid'];
		currentprognum = json['currentprognum'];
		if (json['feedspeeddata'] != null) {
			feedspeeddata = new List<CncModelCnc01Feedspeeddata>();(json['feedspeeddata'] as List).forEach((v) { feedspeeddata.add(new CncModelCnc01Feedspeeddata.fromJson(v)); });
		}
		acqtime = json['acqtime'];
		mainprognum = json['mainprognum'];
		seqnum = json['seqnum'];
		uTI = json['UTI'];
		cycletime = json['cycletime'];
		mac = json['mac'] != null ? new CncModelCnc01Mac.fromJson(json['mac']) : null;
		dis = json['dis'] != null ? new CncModelCnc01Dis.fromJson(json['dis']) : null;
		cncruntime = json['cncruntime'];
		spindleRealSpeed = json['spindle_real_speed'];
		spindlespeed = json['spindlespeed'];
		rel = json['rel'] != null ? new CncModelCnc01Rel.fromJson(json['rel']) : null;
		spload = json['spload'];
		partcount = json['partcount'];
		cncpowerontime = json['cncpowerontime'];
		if (json['daycount'] != null) {
			daycount = new List<CncModelCnc01Daycount>();(json['daycount'] as List).forEach((v) { daycount.add(new CncModelCnc01Daycount.fromJson(v)); });
		}
		totalcount = json['totalcount'];
		cncworkratio = json['cncworkratio'];
		tooldata = json['tooldata']?.cast<String>();
		servRealSpeedX = json['serv_real_speed_x'];
		otherData = json['otherData'] != null ? new CncModelCnc01Otherdata.fromJson(json['otherData']) : null;
		reqcount = json['reqcount'];
		progworkratio = json['progworkratio'];
		svload = json['svload'];
		spindleCmdSpeed = json['spindle_cmd_speed'];
		spindleCurrent = json['spindle_current'] != null ? new CncModelCnc01SpindleCurrent.fromJson(json['spindle_current']) : null;
		spindlecount = json['spindlecount'];
		abs = json['abs'] != null ? new CncModelCnc01Abs.fromJson(json['abs']) : null;
		cnccuttingtime = json['cnccuttingtime'];
		if (json['hourcount'] != null) {
			hourcount = new List<CncModelCnc01Hourcount>();(json['hourcount'] as List).forEach((v) { hourcount.add(new CncModelCnc01Hourcount.fromJson(v)); });
		}
		feedspeed = json['feedspeed'];
		alarmtime = json['alarmtime'];
		servSpeedRate = json['serv_speed_rate'];
		spindleTemp = json['spindle_temp'] != null ? new CncModelCnc01SpindleTemp.fromJson(json['spindle_temp']) : null;
		toolNum = json['tool_num'];
		spindleSpeedRate = json['spindle_speed_rate'];
		servoCmdSpeed = json['servo_cmd_speed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['devid'] = this.devid;
		data['currentprognum'] = this.currentprognum;
		if (this.feedspeeddata != null) {
      data['feedspeeddata'] =  this.feedspeeddata.map((v) => v.toJson()).toList();
    }
		data['acqtime'] = this.acqtime;
		data['mainprognum'] = this.mainprognum;
		data['seqnum'] = this.seqnum;
		data['UTI'] = this.uTI;
		data['cycletime'] = this.cycletime;
		if (this.mac != null) {
      data['mac'] = this.mac.toJson();
    }
		if (this.dis != null) {
      data['dis'] = this.dis.toJson();
    }
		data['cncruntime'] = this.cncruntime;
		data['spindle_real_speed'] = this.spindleRealSpeed;
		data['spindlespeed'] = this.spindlespeed;
		if (this.rel != null) {
      data['rel'] = this.rel.toJson();
    }
		data['spload'] = this.spload;
		data['partcount'] = this.partcount;
		data['cncpowerontime'] = this.cncpowerontime;
		if (this.daycount != null) {
      data['daycount'] =  this.daycount.map((v) => v.toJson()).toList();
    }
		data['totalcount'] = this.totalcount;
		data['cncworkratio'] = this.cncworkratio;
		data['tooldata'] = this.tooldata;
		data['serv_real_speed_x'] = this.servRealSpeedX;
		if (this.otherData != null) {
      data['otherData'] = this.otherData.toJson();
    }
		data['reqcount'] = this.reqcount;
		data['progworkratio'] = this.progworkratio;
		data['svload'] = this.svload;
		data['spindle_cmd_speed'] = this.spindleCmdSpeed;
		if (this.spindleCurrent != null) {
      data['spindle_current'] = this.spindleCurrent.toJson();
    }
		data['spindlecount'] = this.spindlecount;
		if (this.abs != null) {
      data['abs'] = this.abs.toJson();
    }
		data['cnccuttingtime'] = this.cnccuttingtime;
		if (this.hourcount != null) {
      data['hourcount'] =  this.hourcount.map((v) => v.toJson()).toList();
    }
		data['feedspeed'] = this.feedspeed;
		data['alarmtime'] = this.alarmtime;
		data['serv_speed_rate'] = this.servSpeedRate;
		if (this.spindleTemp != null) {
      data['spindle_temp'] = this.spindleTemp.toJson();
    }
		data['tool_num'] = this.toolNum;
		data['spindle_speed_rate'] = this.spindleSpeedRate;
		data['servo_cmd_speed'] = this.servoCmdSpeed;
		return data;
	}
}

class CncModelCnc01Feedspeeddata {
	int count;
	String time;

	CncModelCnc01Feedspeeddata({this.count, this.time});

	CncModelCnc01Feedspeeddata.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		time = json['time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['time'] = this.time;
		return data;
	}
}

class CncModelCnc01Mac {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc01Mac({this.x, this.y, this.z, this.da});

	CncModelCnc01Mac.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc01Dis {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc01Dis({this.x, this.y, this.z, this.da});

	CncModelCnc01Dis.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc01Rel {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc01Rel({this.x, this.y, this.z, this.da});

	CncModelCnc01Rel.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc01Daycount {
	int count;
	String day;

	CncModelCnc01Daycount({this.count, this.day});

	CncModelCnc01Daycount.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		day = json['day'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['day'] = this.day;
		return data;
	}
}

class CncModelCnc01Otherdata {
	String mstbmode;
	String runstatus;
	String cncType;
	String motion;
	String edit;
	String axes;
	String emergency;
	String version;
	String dummy;
	String isalarm;
	String alarmMes;
	String alarmType;
	int maxAxis;
	String series;
	String mtType;
	String tmmode;
	String autmode;
	String addinfo;

	CncModelCnc01Otherdata({this.mstbmode, this.runstatus, this.cncType, this.motion, this.edit, this.axes, this.emergency, this.version, this.dummy, this.isalarm, this.alarmMes, this.alarmType, this.maxAxis, this.series, this.mtType, this.tmmode, this.autmode, this.addinfo});

	CncModelCnc01Otherdata.fromJson(Map<String, dynamic> json) {
		mstbmode = json['mstbmode'];
		runstatus = json['runstatus'];
		cncType = json['cnc_type'];
		motion = json['motion'];
		edit = json['edit'];
		axes = json['axes'];
		emergency = json['emergency'];
		version = json['version'];
		dummy = json['dummy'];
		isalarm = json['isalarm'];
		alarmMes = json['alarm_mes'];
		alarmType = json['alarm_type'];
		maxAxis = json['max_axis'];
		series = json['series'];
		mtType = json['mt_type'];
		tmmode = json['tmmode'];
		autmode = json['autmode'];
		addinfo = json['addinfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mstbmode'] = this.mstbmode;
		data['runstatus'] = this.runstatus;
		data['cnc_type'] = this.cncType;
		data['motion'] = this.motion;
		data['edit'] = this.edit;
		data['axes'] = this.axes;
		data['emergency'] = this.emergency;
		data['version'] = this.version;
		data['dummy'] = this.dummy;
		data['isalarm'] = this.isalarm;
		data['alarm_mes'] = this.alarmMes;
		data['alarm_type'] = this.alarmType;
		data['max_axis'] = this.maxAxis;
		data['series'] = this.series;
		data['mt_type'] = this.mtType;
		data['tmmode'] = this.tmmode;
		data['autmode'] = this.autmode;
		data['addinfo'] = this.addinfo;
		return data;
	}
}

class CncModelCnc01SpindleCurrent {
	int servoCurrentY;
	int servoCurrentX;
	int servoCurrentZ;
	int spindleCurrent;

	CncModelCnc01SpindleCurrent({this.servoCurrentY, this.servoCurrentX, this.servoCurrentZ, this.spindleCurrent});

	CncModelCnc01SpindleCurrent.fromJson(Map<String, dynamic> json) {
		servoCurrentY = json['servo_current_y'];
		servoCurrentX = json['servo_current_x'];
		servoCurrentZ = json['servo_current_z'];
		spindleCurrent = json['spindle_current'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_current_y'] = this.servoCurrentY;
		data['servo_current_x'] = this.servoCurrentX;
		data['servo_current_z'] = this.servoCurrentZ;
		data['spindle_current'] = this.spindleCurrent;
		return data;
	}
}

class CncModelCnc01Abs {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc01Abs({this.x, this.y, this.z, this.da});

	CncModelCnc01Abs.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc01Hourcount {
	String hour;
	int count;

	CncModelCnc01Hourcount({this.hour, this.count});

	CncModelCnc01Hourcount.fromJson(Map<String, dynamic> json) {
		hour = json['hour'];
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hour'] = this.hour;
		data['count'] = this.count;
		return data;
	}
}

class CncModelCnc01SpindleTemp {
	int servoTempY;
	int spindleTemp;
	int servoTempZ;
	int servoTempX;

	CncModelCnc01SpindleTemp({this.servoTempY, this.spindleTemp, this.servoTempZ, this.servoTempX});

	CncModelCnc01SpindleTemp.fromJson(Map<String, dynamic> json) {
		servoTempY = json['servo_temp_y'];
		spindleTemp = json['spindle_temp'];
		servoTempZ = json['servo_temp_z'];
		servoTempX = json['servo_temp_x'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_temp_y'] = this.servoTempY;
		data['spindle_temp'] = this.spindleTemp;
		data['servo_temp_z'] = this.servoTempZ;
		data['servo_temp_x'] = this.servoTempX;
		return data;
	}
}

class CncModelCnc02 {
	String devid;
	int currentprognum;
	List<CncModelCnc02Feedspeeddata> feedspeeddata;
	int acqtime;
	int mainprognum;
	int seqnum;
	double uTI;
	String cycletime;
	CncModelCnc02Mac mac;
	CncModelCnc02Dis dis;
	String cncruntime;
	int spindleRealSpeed;
	int spindlespeed;
	CncModelCnc02Rel rel;
	String spload;
	int partcount;
	String cncpowerontime;
	List<CncModelCnc02Daycount> daycount;
	int totalcount;
	dynamic cncworkratio;
	List<String> tooldata;
	int servRealSpeedX;
	CncModelCnc02Otherdata otherData;
	int reqcount;
	dynamic progworkratio;
	String svload;
	int spindleCmdSpeed;
	CncModelCnc02SpindleCurrent spindleCurrent;
	int spindlecount;
	CncModelCnc02Abs abs;
	String cnccuttingtime;
	List<CncModelCnc02Hourcount> hourcount;
	int feedspeed;
	String alarmtime;
	double servSpeedRate;
	CncModelCnc02SpindleTemp spindleTemp;
	int toolNum;
	double spindleSpeedRate;
	int servoCmdSpeed;

	CncModelCnc02({this.devid, this.currentprognum, this.feedspeeddata, this.acqtime, this.mainprognum, this.seqnum, this.uTI, this.cycletime, this.mac, this.dis, this.cncruntime, this.spindleRealSpeed, this.spindlespeed, this.rel, this.spload, this.partcount, this.cncpowerontime, this.daycount, this.totalcount, this.cncworkratio, this.tooldata, this.servRealSpeedX, this.otherData, this.reqcount, this.progworkratio, this.svload, this.spindleCmdSpeed, this.spindleCurrent, this.spindlecount, this.abs, this.cnccuttingtime, this.hourcount, this.feedspeed, this.alarmtime, this.servSpeedRate, this.spindleTemp, this.toolNum, this.spindleSpeedRate, this.servoCmdSpeed});

	CncModelCnc02.fromJson(Map<String, dynamic> json) {
		devid = json['devid'];
		currentprognum = json['currentprognum'];
		if (json['feedspeeddata'] != null) {
			feedspeeddata = new List<CncModelCnc02Feedspeeddata>();(json['feedspeeddata'] as List).forEach((v) { feedspeeddata.add(new CncModelCnc02Feedspeeddata.fromJson(v)); });
		}
		acqtime = json['acqtime'];
		mainprognum = json['mainprognum'];
		seqnum = json['seqnum'];
		uTI = json['UTI'];
		cycletime = json['cycletime'];
		mac = json['mac'] != null ? new CncModelCnc02Mac.fromJson(json['mac']) : null;
		dis = json['dis'] != null ? new CncModelCnc02Dis.fromJson(json['dis']) : null;
		cncruntime = json['cncruntime'];
		spindleRealSpeed = json['spindle_real_speed'];
		spindlespeed = json['spindlespeed'];
		rel = json['rel'] != null ? new CncModelCnc02Rel.fromJson(json['rel']) : null;
		spload = json['spload'];
		partcount = json['partcount'];
		cncpowerontime = json['cncpowerontime'];
		if (json['daycount'] != null) {
			daycount = new List<CncModelCnc02Daycount>();(json['daycount'] as List).forEach((v) { daycount.add(new CncModelCnc02Daycount.fromJson(v)); });
		}
		totalcount = json['totalcount'];
		cncworkratio = json['cncworkratio'];
		tooldata = json['tooldata']?.cast<String>();
		servRealSpeedX = json['serv_real_speed_x'];
		otherData = json['otherData'] != null ? new CncModelCnc02Otherdata.fromJson(json['otherData']) : null;
		reqcount = json['reqcount'];
		progworkratio = json['progworkratio'];
		svload = json['svload'];
		spindleCmdSpeed = json['spindle_cmd_speed'];
		spindleCurrent = json['spindle_current'] != null ? new CncModelCnc02SpindleCurrent.fromJson(json['spindle_current']) : null;
		spindlecount = json['spindlecount'];
		abs = json['abs'] != null ? new CncModelCnc02Abs.fromJson(json['abs']) : null;
		cnccuttingtime = json['cnccuttingtime'];
		if (json['hourcount'] != null) {
			hourcount = new List<CncModelCnc02Hourcount>();(json['hourcount'] as List).forEach((v) { hourcount.add(new CncModelCnc02Hourcount.fromJson(v)); });
		}
		feedspeed = json['feedspeed'];
		alarmtime = json['alarmtime'];
		servSpeedRate = json['serv_speed_rate'];
		spindleTemp = json['spindle_temp'] != null ? new CncModelCnc02SpindleTemp.fromJson(json['spindle_temp']) : null;
		toolNum = json['tool_num'];
		spindleSpeedRate = json['spindle_speed_rate'];
		servoCmdSpeed = json['servo_cmd_speed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['devid'] = this.devid;
		data['currentprognum'] = this.currentprognum;
		if (this.feedspeeddata != null) {
      data['feedspeeddata'] =  this.feedspeeddata.map((v) => v.toJson()).toList();
    }
		data['acqtime'] = this.acqtime;
		data['mainprognum'] = this.mainprognum;
		data['seqnum'] = this.seqnum;
		data['UTI'] = this.uTI;
		data['cycletime'] = this.cycletime;
		if (this.mac != null) {
      data['mac'] = this.mac.toJson();
    }
		if (this.dis != null) {
      data['dis'] = this.dis.toJson();
    }
		data['cncruntime'] = this.cncruntime;
		data['spindle_real_speed'] = this.spindleRealSpeed;
		data['spindlespeed'] = this.spindlespeed;
		if (this.rel != null) {
      data['rel'] = this.rel.toJson();
    }
		data['spload'] = this.spload;
		data['partcount'] = this.partcount;
		data['cncpowerontime'] = this.cncpowerontime;
		if (this.daycount != null) {
      data['daycount'] =  this.daycount.map((v) => v.toJson()).toList();
    }
		data['totalcount'] = this.totalcount;
		data['cncworkratio'] = this.cncworkratio;
		data['tooldata'] = this.tooldata;
		data['serv_real_speed_x'] = this.servRealSpeedX;
		if (this.otherData != null) {
      data['otherData'] = this.otherData.toJson();
    }
		data['reqcount'] = this.reqcount;
		data['progworkratio'] = this.progworkratio;
		data['svload'] = this.svload;
		data['spindle_cmd_speed'] = this.spindleCmdSpeed;
		if (this.spindleCurrent != null) {
      data['spindle_current'] = this.spindleCurrent.toJson();
    }
		data['spindlecount'] = this.spindlecount;
		if (this.abs != null) {
      data['abs'] = this.abs.toJson();
    }
		data['cnccuttingtime'] = this.cnccuttingtime;
		if (this.hourcount != null) {
      data['hourcount'] =  this.hourcount.map((v) => v.toJson()).toList();
    }
		data['feedspeed'] = this.feedspeed;
		data['alarmtime'] = this.alarmtime;
		data['serv_speed_rate'] = this.servSpeedRate;
		if (this.spindleTemp != null) {
      data['spindle_temp'] = this.spindleTemp.toJson();
    }
		data['tool_num'] = this.toolNum;
		data['spindle_speed_rate'] = this.spindleSpeedRate;
		data['servo_cmd_speed'] = this.servoCmdSpeed;
		return data;
	}
}

class CncModelCnc02Feedspeeddata {
	int count;
	String time;

	CncModelCnc02Feedspeeddata({this.count, this.time});

	CncModelCnc02Feedspeeddata.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		time = json['time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['time'] = this.time;
		return data;
	}
}

class CncModelCnc02Mac {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc02Mac({this.x, this.y, this.z, this.da});

	CncModelCnc02Mac.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc02Dis {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc02Dis({this.x, this.y, this.z, this.da});

	CncModelCnc02Dis.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc02Rel {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc02Rel({this.x, this.y, this.z, this.da});

	CncModelCnc02Rel.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc02Daycount {
	int count;
	String day;

	CncModelCnc02Daycount({this.count, this.day});

	CncModelCnc02Daycount.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		day = json['day'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['day'] = this.day;
		return data;
	}
}

class CncModelCnc02Otherdata {
	String mstbmode;
	String runstatus;
	String cncType;
	String motion;
	String edit;
	String axes;
	String emergency;
	String version;
	String dummy;
	String isalarm;
	String alarmMes;
	String alarmType;
	int maxAxis;
	String series;
	String mtType;
	String tmmode;
	String autmode;
	String addinfo;

	CncModelCnc02Otherdata({this.mstbmode, this.runstatus, this.cncType, this.motion, this.edit, this.axes, this.emergency, this.version, this.dummy, this.isalarm, this.alarmMes, this.alarmType, this.maxAxis, this.series, this.mtType, this.tmmode, this.autmode, this.addinfo});

	CncModelCnc02Otherdata.fromJson(Map<String, dynamic> json) {
		mstbmode = json['mstbmode'];
		runstatus = json['runstatus'];
		cncType = json['cnc_type'];
		motion = json['motion'];
		edit = json['edit'];
		axes = json['axes'];
		emergency = json['emergency'];
		version = json['version'];
		dummy = json['dummy'];
		isalarm = json['isalarm'];
		alarmMes = json['alarm_mes'];
		alarmType = json['alarm_type'];
		maxAxis = json['max_axis'];
		series = json['series'];
		mtType = json['mt_type'];
		tmmode = json['tmmode'];
		autmode = json['autmode'];
		addinfo = json['addinfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mstbmode'] = this.mstbmode;
		data['runstatus'] = this.runstatus;
		data['cnc_type'] = this.cncType;
		data['motion'] = this.motion;
		data['edit'] = this.edit;
		data['axes'] = this.axes;
		data['emergency'] = this.emergency;
		data['version'] = this.version;
		data['dummy'] = this.dummy;
		data['isalarm'] = this.isalarm;
		data['alarm_mes'] = this.alarmMes;
		data['alarm_type'] = this.alarmType;
		data['max_axis'] = this.maxAxis;
		data['series'] = this.series;
		data['mt_type'] = this.mtType;
		data['tmmode'] = this.tmmode;
		data['autmode'] = this.autmode;
		data['addinfo'] = this.addinfo;
		return data;
	}
}

class CncModelCnc02SpindleCurrent {
	int servoCurrentY;
	int servoCurrentX;
	int servoCurrentZ;
	int spindleCurrent;

	CncModelCnc02SpindleCurrent({this.servoCurrentY, this.servoCurrentX, this.servoCurrentZ, this.spindleCurrent});

	CncModelCnc02SpindleCurrent.fromJson(Map<String, dynamic> json) {
		servoCurrentY = json['servo_current_y'];
		servoCurrentX = json['servo_current_x'];
		servoCurrentZ = json['servo_current_z'];
		spindleCurrent = json['spindle_current'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_current_y'] = this.servoCurrentY;
		data['servo_current_x'] = this.servoCurrentX;
		data['servo_current_z'] = this.servoCurrentZ;
		data['spindle_current'] = this.spindleCurrent;
		return data;
	}
}

class CncModelCnc02Abs {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc02Abs({this.x, this.y, this.z, this.da});

	CncModelCnc02Abs.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc02Hourcount {
	String hour;
	int count;

	CncModelCnc02Hourcount({this.hour, this.count});

	CncModelCnc02Hourcount.fromJson(Map<String, dynamic> json) {
		hour = json['hour'];
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hour'] = this.hour;
		data['count'] = this.count;
		return data;
	}
}

class CncModelCnc02SpindleTemp {
	int servoTempY;
	int spindleTemp;
	int servoTempZ;
	int servoTempX;

	CncModelCnc02SpindleTemp({this.servoTempY, this.spindleTemp, this.servoTempZ, this.servoTempX});

	CncModelCnc02SpindleTemp.fromJson(Map<String, dynamic> json) {
		servoTempY = json['servo_temp_y'];
		spindleTemp = json['spindle_temp'];
		servoTempZ = json['servo_temp_z'];
		servoTempX = json['servo_temp_x'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_temp_y'] = this.servoTempY;
		data['spindle_temp'] = this.spindleTemp;
		data['servo_temp_z'] = this.servoTempZ;
		data['servo_temp_x'] = this.servoTempX;
		return data;
	}
}

class CncModelCnc14 {
	String devid;
	int currentprognum;
	List<CncModelCnc14Feedspeeddata> feedspeeddata;
	int acqtime;
	int mainprognum;
	int seqnum;
	double uTI;
	String cycletime;
	CncModelCnc14Mac mac;
	CncModelCnc14Dis dis;
	String cncruntime;
	int spindleRealSpeed;
	int spindlespeed;
	CncModelCnc14Rel rel;
	String spload;
	int partcount;
	String cncpowerontime;
	List<CncModelCnc14Daycount> daycount;
	int totalcount;
	dynamic cncworkratio;
	List<String> tooldata;
	int servRealSpeedX;
	CncModelCnc14Otherdata otherData;
	int reqcount;
	dynamic progworkratio;
	String svload;
	int spindleCmdSpeed;
	CncModelCnc14SpindleCurrent spindleCurrent;
	int spindlecount;
	CncModelCnc14Abs abs;
	String cnccuttingtime;
	List<CncModelCnc14Hourcount> hourcount;
	int feedspeed;
	String alarmtime;
	double servSpeedRate;
	CncModelCnc14SpindleTemp spindleTemp;
	int toolNum;
	double spindleSpeedRate;
	int servoCmdSpeed;

	CncModelCnc14({this.devid, this.currentprognum, this.feedspeeddata, this.acqtime, this.mainprognum, this.seqnum, this.uTI, this.cycletime, this.mac, this.dis, this.cncruntime, this.spindleRealSpeed, this.spindlespeed, this.rel, this.spload, this.partcount, this.cncpowerontime, this.daycount, this.totalcount, this.cncworkratio, this.tooldata, this.servRealSpeedX, this.otherData, this.reqcount, this.progworkratio, this.svload, this.spindleCmdSpeed, this.spindleCurrent, this.spindlecount, this.abs, this.cnccuttingtime, this.hourcount, this.feedspeed, this.alarmtime, this.servSpeedRate, this.spindleTemp, this.toolNum, this.spindleSpeedRate, this.servoCmdSpeed});

	CncModelCnc14.fromJson(Map<String, dynamic> json) {
		devid = json['devid'];
		currentprognum = json['currentprognum'];
		if (json['feedspeeddata'] != null) {
			feedspeeddata = new List<CncModelCnc14Feedspeeddata>();(json['feedspeeddata'] as List).forEach((v) { feedspeeddata.add(new CncModelCnc14Feedspeeddata.fromJson(v)); });
		}
		acqtime = json['acqtime'];
		mainprognum = json['mainprognum'];
		seqnum = json['seqnum'];
		uTI = json['UTI'];
		cycletime = json['cycletime'];
		mac = json['mac'] != null ? new CncModelCnc14Mac.fromJson(json['mac']) : null;
		dis = json['dis'] != null ? new CncModelCnc14Dis.fromJson(json['dis']) : null;
		cncruntime = json['cncruntime'];
		spindleRealSpeed = json['spindle_real_speed'];
		spindlespeed = json['spindlespeed'];
		rel = json['rel'] != null ? new CncModelCnc14Rel.fromJson(json['rel']) : null;
		spload = json['spload'];
		partcount = json['partcount'];
		cncpowerontime = json['cncpowerontime'];
		if (json['daycount'] != null) {
			daycount = new List<CncModelCnc14Daycount>();(json['daycount'] as List).forEach((v) { daycount.add(new CncModelCnc14Daycount.fromJson(v)); });
		}
		totalcount = json['totalcount'];
		cncworkratio = json['cncworkratio'];
		tooldata = json['tooldata']?.cast<String>();
		servRealSpeedX = json['serv_real_speed_x'];
		otherData = json['otherData'] != null ? new CncModelCnc14Otherdata.fromJson(json['otherData']) : null;
		reqcount = json['reqcount'];
		progworkratio = json['progworkratio'];
		svload = json['svload'];
		spindleCmdSpeed = json['spindle_cmd_speed'];
		spindleCurrent = json['spindle_current'] != null ? new CncModelCnc14SpindleCurrent.fromJson(json['spindle_current']) : null;
		spindlecount = json['spindlecount'];
		abs = json['abs'] != null ? new CncModelCnc14Abs.fromJson(json['abs']) : null;
		cnccuttingtime = json['cnccuttingtime'];
		if (json['hourcount'] != null) {
			hourcount = new List<CncModelCnc14Hourcount>();(json['hourcount'] as List).forEach((v) { hourcount.add(new CncModelCnc14Hourcount.fromJson(v)); });
		}
		feedspeed = json['feedspeed'];
		alarmtime = json['alarmtime'];
		servSpeedRate = json['serv_speed_rate'];
		spindleTemp = json['spindle_temp'] != null ? new CncModelCnc14SpindleTemp.fromJson(json['spindle_temp']) : null;
		toolNum = json['tool_num'];
		spindleSpeedRate = json['spindle_speed_rate'];
		servoCmdSpeed = json['servo_cmd_speed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['devid'] = this.devid;
		data['currentprognum'] = this.currentprognum;
		if (this.feedspeeddata != null) {
      data['feedspeeddata'] =  this.feedspeeddata.map((v) => v.toJson()).toList();
    }
		data['acqtime'] = this.acqtime;
		data['mainprognum'] = this.mainprognum;
		data['seqnum'] = this.seqnum;
		data['UTI'] = this.uTI;
		data['cycletime'] = this.cycletime;
		if (this.mac != null) {
      data['mac'] = this.mac.toJson();
    }
		if (this.dis != null) {
      data['dis'] = this.dis.toJson();
    }
		data['cncruntime'] = this.cncruntime;
		data['spindle_real_speed'] = this.spindleRealSpeed;
		data['spindlespeed'] = this.spindlespeed;
		if (this.rel != null) {
      data['rel'] = this.rel.toJson();
    }
		data['spload'] = this.spload;
		data['partcount'] = this.partcount;
		data['cncpowerontime'] = this.cncpowerontime;
		if (this.daycount != null) {
      data['daycount'] =  this.daycount.map((v) => v.toJson()).toList();
    }
		data['totalcount'] = this.totalcount;
		data['cncworkratio'] = this.cncworkratio;
		data['tooldata'] = this.tooldata;
		data['serv_real_speed_x'] = this.servRealSpeedX;
		if (this.otherData != null) {
      data['otherData'] = this.otherData.toJson();
    }
		data['reqcount'] = this.reqcount;
		data['progworkratio'] = this.progworkratio;
		data['svload'] = this.svload;
		data['spindle_cmd_speed'] = this.spindleCmdSpeed;
		if (this.spindleCurrent != null) {
      data['spindle_current'] = this.spindleCurrent.toJson();
    }
		data['spindlecount'] = this.spindlecount;
		if (this.abs != null) {
      data['abs'] = this.abs.toJson();
    }
		data['cnccuttingtime'] = this.cnccuttingtime;
		if (this.hourcount != null) {
      data['hourcount'] =  this.hourcount.map((v) => v.toJson()).toList();
    }
		data['feedspeed'] = this.feedspeed;
		data['alarmtime'] = this.alarmtime;
		data['serv_speed_rate'] = this.servSpeedRate;
		if (this.spindleTemp != null) {
      data['spindle_temp'] = this.spindleTemp.toJson();
    }
		data['tool_num'] = this.toolNum;
		data['spindle_speed_rate'] = this.spindleSpeedRate;
		data['servo_cmd_speed'] = this.servoCmdSpeed;
		return data;
	}
}

class CncModelCnc14Feedspeeddata {
	int count;
	String time;

	CncModelCnc14Feedspeeddata({this.count, this.time});

	CncModelCnc14Feedspeeddata.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		time = json['time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['time'] = this.time;
		return data;
	}
}

class CncModelCnc14Mac {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc14Mac({this.x, this.y, this.z, this.da});

	CncModelCnc14Mac.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc14Dis {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc14Dis({this.x, this.y, this.z, this.da});

	CncModelCnc14Dis.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc14Rel {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc14Rel({this.x, this.y, this.z, this.da});

	CncModelCnc14Rel.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc14Daycount {
	int count;
	String day;

	CncModelCnc14Daycount({this.count, this.day});

	CncModelCnc14Daycount.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		day = json['day'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		data['day'] = this.day;
		return data;
	}
}

class CncModelCnc14Otherdata {
	String mstbmode;
	String runstatus;
	String cncType;
	String motion;
	String edit;
	String axes;
	String emergency;
	String version;
	String dummy;
	String isalarm;
	String alarmMes;
	String alarmType;
	int maxAxis;
	String series;
	String mtType;
	String tmmode;
	String autmode;
	String addinfo;

	CncModelCnc14Otherdata({this.mstbmode, this.runstatus, this.cncType, this.motion, this.edit, this.axes, this.emergency, this.version, this.dummy, this.isalarm, this.alarmMes, this.alarmType, this.maxAxis, this.series, this.mtType, this.tmmode, this.autmode, this.addinfo});

	CncModelCnc14Otherdata.fromJson(Map<String, dynamic> json) {
		mstbmode = json['mstbmode'];
		runstatus = json['runstatus'];
		cncType = json['cnc_type'];
		motion = json['motion'];
		edit = json['edit'];
		axes = json['axes'];
		emergency = json['emergency'];
		version = json['version'];
		dummy = json['dummy'];
		isalarm = json['isalarm'];
		alarmMes = json['alarm_mes'];
		alarmType = json['alarm_type'];
		maxAxis = json['max_axis'];
		series = json['series'];
		mtType = json['mt_type'];
		tmmode = json['tmmode'];
		autmode = json['autmode'];
		addinfo = json['addinfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mstbmode'] = this.mstbmode;
		data['runstatus'] = this.runstatus;
		data['cnc_type'] = this.cncType;
		data['motion'] = this.motion;
		data['edit'] = this.edit;
		data['axes'] = this.axes;
		data['emergency'] = this.emergency;
		data['version'] = this.version;
		data['dummy'] = this.dummy;
		data['isalarm'] = this.isalarm;
		data['alarm_mes'] = this.alarmMes;
		data['alarm_type'] = this.alarmType;
		data['max_axis'] = this.maxAxis;
		data['series'] = this.series;
		data['mt_type'] = this.mtType;
		data['tmmode'] = this.tmmode;
		data['autmode'] = this.autmode;
		data['addinfo'] = this.addinfo;
		return data;
	}
}

class CncModelCnc14SpindleCurrent {
	int servoCurrentY;
	int servoCurrentX;
	int servoCurrentZ;
	int spindleCurrent;

	CncModelCnc14SpindleCurrent({this.servoCurrentY, this.servoCurrentX, this.servoCurrentZ, this.spindleCurrent});

	CncModelCnc14SpindleCurrent.fromJson(Map<String, dynamic> json) {
		servoCurrentY = json['servo_current_y'];
		servoCurrentX = json['servo_current_x'];
		servoCurrentZ = json['servo_current_z'];
		spindleCurrent = json['spindle_current'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_current_y'] = this.servoCurrentY;
		data['servo_current_x'] = this.servoCurrentX;
		data['servo_current_z'] = this.servoCurrentZ;
		data['spindle_current'] = this.spindleCurrent;
		return data;
	}
}

class CncModelCnc14Abs {
	double x;
	double y;
	double z;
	double da;

	CncModelCnc14Abs({this.x, this.y, this.z, this.da});

	CncModelCnc14Abs.fromJson(Map<String, dynamic> json) {
		x = json['x'];
		y = json['y'];
		z = json['z'];
		da = json['da'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['x'] = this.x;
		data['y'] = this.y;
		data['z'] = this.z;
		data['da'] = this.da;
		return data;
	}
}

class CncModelCnc14Hourcount {
	String hour;
	int count;

	CncModelCnc14Hourcount({this.hour, this.count});

	CncModelCnc14Hourcount.fromJson(Map<String, dynamic> json) {
		hour = json['hour'];
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hour'] = this.hour;
		data['count'] = this.count;
		return data;
	}
}

class CncModelCnc14SpindleTemp {
	int servoTempY;
	int spindleTemp;
	int servoTempZ;
	int servoTempX;

	CncModelCnc14SpindleTemp({this.servoTempY, this.spindleTemp, this.servoTempZ, this.servoTempX});

	CncModelCnc14SpindleTemp.fromJson(Map<String, dynamic> json) {
		servoTempY = json['servo_temp_y'];
		spindleTemp = json['spindle_temp'];
		servoTempZ = json['servo_temp_z'];
		servoTempX = json['servo_temp_x'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['servo_temp_y'] = this.servoTempY;
		data['spindle_temp'] = this.spindleTemp;
		data['servo_temp_z'] = this.servoTempZ;
		data['servo_temp_x'] = this.servoTempX;
		return data;
	}
}
