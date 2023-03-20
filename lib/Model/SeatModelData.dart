class SeatModelData {
  bool? status;
  List<BusList>? busList;

  SeatModelData({this.status, this.busList});

  SeatModelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['bus_list'] != null) {
      busList = <BusList>[];
      json['bus_list'].forEach((v) {
        busList!.add(new BusList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.busList != null) {
      data['bus_list'] = this.busList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusList {
  int? busId;
  int? seatCount;
  String? seatLayout;

  BusList({this.busId, this.seatCount, this.seatLayout});

  BusList.fromJson(Map<String, dynamic> json) {
    busId = json['bus_id'];
    seatCount = json['seat_count'];
    seatLayout = json['seat_layout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bus_id'] = this.busId;
    data['seat_count'] = this.seatCount;
    data['seat_layout'] = this.seatLayout;
    return data;
  }
}
