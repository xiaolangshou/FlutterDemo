class CoordDetailModelEntity {
  CoordDetailModelFanuc cNC01;
  CoordDetailModelFanuc cNC02;
  CoordDetailModelFanuc cNC14;
  CoordDetailModelFanuc cNC15;

  CoordDetailModelEntity({this.cNC01, this.cNC02, this.cNC14, this.cNC15});

  CoordDetailModelEntity.fromJson(Map<String, dynamic> json) {
    cNC02 = json['CNC02'] != null
        ? new CoordDetailModelFanuc.fromJson(json['CNC02'])
        : null;
    cNC01 = json['CNC01'] != null
        ? new CoordDetailModelFanuc.fromJson(json['CNC01'])
        : null;
    cNC14 = json['CNC14'] != null
        ? new CoordDetailModelFanuc.fromJson(json['CNC14'])
        : null;
    cNC15 = json['CNC15'] != null
        ? new CoordDetailModelFanuc.fromJson(json['CNC15'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cNC02 != null) {
      data['CNC02'] = this.cNC02.toJson();
    }
    if (this.cNC01 != null) {
      data['CNC01'] = this.cNC01.toJson();
    }
    if (this.cNC14 != null) {
      data['CNC14'] = this.cNC14.toJson();
    }
    if (this.cNC15 != null) {
      data['CNC15'] = this.cNC15.toJson();
    }
    return data;
  }
}

class CoordDetailModelFanuc {
  String devid;
  int currentprognum;
  List<CoordDetailModelFanucFeedspeeddata> feedspeeddata;
  int acqtime;
  int mainprognum;
  int seqnum;
  double uTI;
  String cycletime;
  CoordDetailModelFanucMac mac;
  CoordDetailModelFanucDis dis;
  String cncruntime;
  int spindleRealSpeed;
  int spindlespeed;
  CoordDetailModelFanucRel rel;
  String spload;
  int partcount;
  String cncpowerontime;
  List<CoordDetailModelFanucDaycount> daycount;
  int totalcount;
  String cncworkratio;
  int servRealSpeedY;
  List<String> tooldata;
  int servRealSpeedX;
  CoordDetailModelFanucOtherdata otherData;
  int servRealSpeedZ;
  int reqcount;
  String progworkratio;
  String svload;
  int spindleCmdSpeed;
  CoordDetailModelFanucSpindleCurrent spindleCurrent;
  int spindlecount;
  CoordDetailModelFanucAbs abs;
  String cnccuttingtime;
  List<CoordDetailModelFanucHourcount> hourcount;
  int feedspeed;
  String alarmtime;
  double servSpeedRate;
  CoordDetailModelFanucSpindleTemp spindleTemp;
  int toolNum;
  double spindleSpeedRate;
  int servoCmdSpeed;

  CoordDetailModelFanuc(
      {this.devid,
        this.currentprognum,
        this.feedspeeddata,
        this.acqtime,
        this.mainprognum,
        this.seqnum,
        this.uTI,
        this.cycletime,
        this.mac,
        this.dis,
        this.cncruntime,
        this.spindleRealSpeed,
        this.spindlespeed,
        this.rel,
        this.spload,
        this.partcount,
        this.cncpowerontime,
        this.daycount,
        this.totalcount,
        this.cncworkratio,
        this.servRealSpeedY,
        this.tooldata,
        this.servRealSpeedX,
        this.otherData,
        this.servRealSpeedZ,
        this.reqcount,
        this.progworkratio,
        this.svload,
        this.spindleCmdSpeed,
        this.spindleCurrent,
        this.spindlecount,
        this.abs,
        this.cnccuttingtime,
        this.hourcount,
        this.feedspeed,
        this.alarmtime,
        this.servSpeedRate,
        this.spindleTemp,
        this.toolNum,
        this.spindleSpeedRate,
        this.servoCmdSpeed});

  CoordDetailModelFanuc.fromJson(Map<String, dynamic> json) {
    devid = json['devid'];
    currentprognum = json['currentprognum'];
    if (json['feedspeeddata'] != null) {
      feedspeeddata = new List<CoordDetailModelFanucFeedspeeddata>();
      (json['feedspeeddata'] as List).forEach((v) {
        feedspeeddata.add(new CoordDetailModelFanucFeedspeeddata.fromJson(v));
      });
    }
    acqtime = json['acqtime'];
    mainprognum = json['mainprognum'];
    seqnum = json['seqnum'];
    uTI =  json['UTI'] != null
        ? double.parse(json['UTI'].toString()):0.0;    cycletime = json['cycletime'];
    mac = json['mac'] != null
        ? new CoordDetailModelFanucMac.fromJson(json['mac'])
        : null;
    dis = json['dis'] != null
        ? new CoordDetailModelFanucDis.fromJson(json['dis'])
        : null;
    cncruntime = json['cncruntime'];
    spindleRealSpeed = json['spindle_real_speed'];
    spindlespeed = json['spindlespeed'];
    rel = json['rel'] != null
        ? new CoordDetailModelFanucRel.fromJson(json['rel'])
        : null;
    spload = json['spload'];
    partcount = json['partcount'];
    cncpowerontime = json['cncpowerontime'];
    if (json['daycount'] != null) {
      daycount = new List<CoordDetailModelFanucDaycount>();
      (json['daycount'] as List).forEach((v) {
        daycount.add(new CoordDetailModelFanucDaycount.fromJson(v));
      });
    }
    totalcount = json['totalcount'];
    cncworkratio = json['cncworkratio'];
    servRealSpeedY = json['serv_real_speed_y'];
    tooldata = json['tooldata']?.cast<String>();
    servRealSpeedX = json['serv_real_speed_x'];
    otherData = json['otherData'] != null
        ? new CoordDetailModelFanucOtherdata.fromJson(json['otherData'])
        : null;
    servRealSpeedZ = json['serv_real_speed_z'];
    reqcount = json['reqcount'];
    progworkratio = json['progworkratio'];
    svload = json['svload'];
    spindleCmdSpeed = json['spindle_cmd_speed'];
    spindleCurrent = json['spindle_current'] != null
        ? new CoordDetailModelFanucSpindleCurrent.fromJson(
        json['spindle_current'])
        : null;
    spindlecount = json['spindlecount'];
    abs = json['abs'] != null
        ? new CoordDetailModelFanucAbs.fromJson(json['abs'])
        : null;
    cnccuttingtime = json['cnccuttingtime'];
    if (json['hourcount'] != null) {
      hourcount = new List<CoordDetailModelFanucHourcount>();
      (json['hourcount'] as List).forEach((v) {
        hourcount.add(new CoordDetailModelFanucHourcount.fromJson(v));
      });
    }
    feedspeed = json['feedspeed'];
    alarmtime = json['alarmtime'];
    servSpeedRate =  json['serv_speed_rate'] != null
        ? double.parse(json['serv_speed_rate'].toString()):0.0;
    spindleTemp = json['spindle_temp'] != null
        ? new CoordDetailModelFanucSpindleTemp.fromJson(json['spindle_temp'])
        : null;
    toolNum = json['tool_num'];
    spindleSpeedRate =  json['spindle_speed_rate'] != null
        ? double.parse(json['spindle_speed_rate'].toString()):0.0;
    servoCmdSpeed = json['servo_cmd_speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['devid'] = this.devid;
    data['currentprognum'] = this.currentprognum;
    if (this.feedspeeddata != null) {
      data['feedspeeddata'] =
          this.feedspeeddata.map((v) => v.toJson()).toList();
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
      data['daycount'] = this.daycount.map((v) => v.toJson()).toList();
    }
    data['totalcount'] = this.totalcount;
    data['cncworkratio'] = this.cncworkratio;
    data['serv_real_speed_y'] = this.servRealSpeedY;
    data['tooldata'] = this.tooldata;
    data['serv_real_speed_x'] = this.servRealSpeedX;
    if (this.otherData != null) {
      data['otherData'] = this.otherData.toJson();
    }
    data['serv_real_speed_z'] = this.servRealSpeedZ;
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
      data['hourcount'] = this.hourcount.map((v) => v.toJson()).toList();
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

class CoordDetailModelFanucFeedspeeddata {
  int count;
  String time;

  CoordDetailModelFanucFeedspeeddata({this.count, this.time});

  CoordDetailModelFanucFeedspeeddata.fromJson(Map<String, dynamic> json) {
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

class CoordDetailModelFanucMac {
  double x;
  double y;
  double z;
  double da;

  CoordDetailModelFanucMac({this.x, this.y, this.z, this.da});

  CoordDetailModelFanucMac.fromJson(Map<String, dynamic> json) {

    x =  json['x'] != null
        ? double.parse(json['x'].toString()):0.0;
    y =  json['y'] != null
        ? double.parse(json['y'].toString()):0.0;
    z =  json['z'] != null
        ? double.parse(json['z'].toString()):0.0;
    da =  json['da'] != null
        ? double.parse(json['da'].toString()):0.0;
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

class CoordDetailModelFanucDis {
  double x;
  double y;
  double z;
  double da;

  CoordDetailModelFanucDis({this.x, this.y, this.z, this.da});

  CoordDetailModelFanucDis.fromJson(Map<String, dynamic> json) {
    x =  json['x'] != null
        ? double.parse(json['x'].toString()):0.0;
    y =  json['y'] != null
        ? double.parse(json['y'].toString()):0.0;
    z =  json['z'] != null
        ? double.parse(json['z'].toString()):0.0;
    da =  json['da'] != null
        ? double.parse(json['da'].toString()):0.0;
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

class CoordDetailModelFanucRel {
  double x;
  double y;
  double z;
  double da;

  CoordDetailModelFanucRel({this.x, this.y, this.z, this.da});

  CoordDetailModelFanucRel.fromJson(Map<String, dynamic> json) {

    x =  json['x'] != null
        ? double.parse(json['x'].toString()):0.0;
    y =  json['y'] != null
        ? double.parse(json['y'].toString()):0.0;
    z =  json['z'] != null
        ? double.parse(json['z'].toString()):0.0;
    da =  json['da'] != null
        ? double.parse(json['da'].toString()):0.0;
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

class CoordDetailModelFanucDaycount {
  int count;
  String day;

  CoordDetailModelFanucDaycount({this.count, this.day});

  CoordDetailModelFanucDaycount.fromJson(Map<String, dynamic> json) {
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

class CoordDetailModelFanucOtherdata {
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

  CoordDetailModelFanucOtherdata(
      {this.mstbmode,
        this.runstatus,
        this.cncType,
        this.motion,
        this.edit,
        this.axes,
        this.emergency,
        this.version,
        this.dummy,
        this.isalarm,
        this.alarmMes,
        this.alarmType,
        this.maxAxis,
        this.series,
        this.mtType,
        this.tmmode,
        this.autmode,
        this.addinfo});

  CoordDetailModelFanucOtherdata.fromJson(Map<String, dynamic> json) {
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

class CoordDetailModelFanucSpindleCurrent {
  int servoCurrentY;
  int servoCurrentX;
  int servoCurrentZ;
  int spindleCurrent;

  CoordDetailModelFanucSpindleCurrent(
      {this.servoCurrentY,
        this.servoCurrentX,
        this.servoCurrentZ,
        this.spindleCurrent});

  CoordDetailModelFanucSpindleCurrent.fromJson(Map<String, dynamic> json) {
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

class CoordDetailModelFanucAbs {
  double x;
  double y;
  double z;
  double da;

  CoordDetailModelFanucAbs({this.x, this.y, this.z, this.da});

  CoordDetailModelFanucAbs.fromJson(Map<String, dynamic> json) {
    x =  json['x'] != null
        ? double.parse(json['x'].toString()):0.0;
    y =  json['y'] != null
        ? double.parse(json['y'].toString()):0.0;
    z =  json['z'] != null
        ? double.parse(json['z'].toString()):0.0;
    da =  json['da'] != null
        ? double.parse(json['da'].toString()):0.0;
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

class CoordDetailModelFanucHourcount {
  String hour;
  int count;

  CoordDetailModelFanucHourcount({this.hour, this.count});

  CoordDetailModelFanucHourcount.fromJson(Map<String, dynamic> json) {
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

class CoordDetailModelFanucSpindleTemp {
  int servoTempY;
  int spindleTemp;
  int servoTempZ;
  int servoTempX;

  CoordDetailModelFanucSpindleTemp(
      {this.servoTempY, this.spindleTemp, this.servoTempZ, this.servoTempX});

  CoordDetailModelFanucSpindleTemp.fromJson(Map<String, dynamic> json) {
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














