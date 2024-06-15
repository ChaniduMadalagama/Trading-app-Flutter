class nifty100Model {
  String? tkr;
  String? td;
  double? op;
  double? hp;
  double? lp;
  double? cp;
  int? vol;
  int? oi;
  bool? eod;

  nifty100Model(
      {this.tkr,
        this.td,
        this.op,
        this.hp,
        this.lp,
        this.cp,
        this.vol,
        this.oi,
        this.eod});

  nifty100Model.fromJson(Map<String, dynamic> json) {
    tkr = json['tkr'];
    td = json['td'];
    op = json['op'];
    hp = json['hp'];
    lp = json['lp'];
    cp = json['cp'];
    vol = json['vol'];
    oi = json['oi'];
    eod = json['eod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tkr'] = this.tkr;
    data['td'] = this.td;
    data['op'] = this.op;
    data['hp'] = this.hp;
    data['lp'] = this.lp;
    data['cp'] = this.cp;
    data['vol'] = this.vol;
    data['oi'] = this.oi;
    data['eod'] = this.eod;
    return data;
  }
}