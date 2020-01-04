class DeviceTaskModelList {
    final List<DeviceTaskModelEntity> deviceTaskModel;
    DeviceTaskModelList({
        this.deviceTaskModel,
    });

    factory DeviceTaskModelList.fromJson(List<dynamic> parsedJson) {
        List<DeviceTaskModelEntity> taskData = new List<DeviceTaskModelEntity>();
        taskData = parsedJson.map((i)=>DeviceTaskModelEntity.fromJson(i)).toList();
        return new DeviceTaskModelList(
            deviceTaskModel: taskData
        );
    }
}



class DeviceTaskModelEntity {
    List<Dayoee> dayoee;
    String devid;
    int hasphoto;
    String photo;
    List<Weekoee> weekoee;
    Worksheet worksheet;

    DeviceTaskModelEntity({this.dayoee, this.devid, this.hasphoto, this.photo, this.weekoee, this.worksheet});

    factory DeviceTaskModelEntity.fromJson(Map<String, dynamic> json) {
        return DeviceTaskModelEntity(
            dayoee: json['dayoee'] != null ? (json['dayoee'] as List).map((i) => Dayoee.fromJson(i)).toList() : null, 
            devid: json['devid'], 
            hasphoto: json['hasphoto'], 
            photo: json['photo'], 
            weekoee: json['weekoee'] != null ? (json['weekoee'] as List).map((i) => Weekoee.fromJson(i)).toList() : null, 
            worksheet: json['worksheet'] != null ? Worksheet.fromJson(json['worksheet']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['devid'] = this.devid;
        data['hasphoto'] = this.hasphoto;
        data['photo'] = this.photo;
        if (this.dayoee != null) {
            data['dayoee'] = this.dayoee.map((v) => v.toJson()).toList();
        }
        if (this.weekoee != null) {
            data['weekoee'] = this.weekoee.map((v) => v.toJson()).toList();
        }
        if (this.worksheet != null) {
            data['worksheet'] = this.worksheet.toJson();
        }
        return data;
    }
}

class Weekoee {
    double oee;
    int time;

    Weekoee({this.oee, this.time});

    factory Weekoee.fromJson(Map<String, dynamic> json) {
        return Weekoee(
            oee: json['oee'],
            time: json['time'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['oee'] = this.oee;
        data['time'] = this.time;
        return data;
    }
}

class Worksheet {
    int completed;
    String gauge1;
    String jig;
    String nextordernumber;
    String ordernumber;
    String predictendtime;
    String productname;
    int quantity;
    String statustime;
    int worksheetstatus;

    Worksheet({this.completed, this.gauge1, this.jig, this.nextordernumber, this.ordernumber, this.predictendtime, this.productname, this.quantity, this.statustime, this.worksheetstatus});

    factory Worksheet.fromJson(Map<String, dynamic> json) {
        return Worksheet(
            completed: json['completed'],
            gauge1: json['gauge1'],
            jig: json['jig'],
            nextordernumber: json['nextordernumber'],
            ordernumber: json['ordernumber'],
            predictendtime: json['predictendtime'],
            productname: json['productname'],
            quantity: json['quantity'],
            statustime: json['statustime'],
            worksheetstatus: json['worksheetstatus'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['completed'] = this.completed;
        data['gauge1'] = this.gauge1;
        data['jig'] = this.jig;
        data['nextordernumber'] = this.nextordernumber;
        data['ordernumber'] = this.ordernumber;
        data['predictendtime'] = this.predictendtime;
        data['productname'] = this.productname;
        data['quantity'] = this.quantity;
        data['statustime'] = this.statustime;
        data['worksheetstatus'] = this.worksheetstatus;
        return data;
    }
}

class Dayoee {
    double oee;
    String time;

    Dayoee({this.oee, this.time});

    factory Dayoee.fromJson(Map<String, dynamic> json) {
        return Dayoee(
            oee: json['oee'],
            time: json['time'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['oee'] = this.oee;
        data['time'] = this.time;
        return data;
    }
}