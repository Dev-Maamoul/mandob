import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:flutter/material.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(top: 0, child: BackButtonCustom()),
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.only(top: 50),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    print(index);
                    return Container(
                      // color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LabelTitleDriverWidget(
                                sizeCard: 200,
                                flex: 2,
                                title: "ID",
                                text: "drive-3CoBeFLrIzGrwP",
                              ),
                              ImageAccount(
                                url:
                                    "https://www.shutterstock.com/image-vector/eagle-logo-fierce-vibrant-soaring-260nw-2494369867.jpg",
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final width = constraints.maxWidth;

                                  double sizeCard = 0;
                                  switch (width) {
                                    case >= 900:
                                      sizeCard = width / 10;
                                      break;
                                    case >= 700 && <= 900:
                                      sizeCard = width;
                                      break;
                                    case >= 500 && <= 700:
                                      sizeCard = width;
                                      break;
                                    case <= 500:
                                      sizeCard = width;
                                      break;
                                    default:
                                  }

                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    spacing: 20,
                                    children: [
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Nationality",
                                        text: "Saudi",
                                      ),
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Name",
                                        text: "Fahad Turki Alazmi",
                                      ),
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Mobile",
                                        text: "966550200006",
                                      ),
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Email",
                                        text: "fahad.alazmi1994@gmail.com",
                                      ),
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Car",
                                        text: "778ddm",
                                      ),
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Orders",
                                        text: "30",
                                      ),
                                      LabelTitleDriverWidget(
                                        sizeCard: sizeCard,
                                        title: "Profits",
                                        text: "3333 RS",
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("View"),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final x = [
  {
    "id": "drive-NwNAzFRQB4Md8b",
    "id_number": "1123597513",
    "reference_code": null,
    "full_name": "turki",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:56:11.524146",
    "mobile": "966550200006",
    "email": null,
    "car_number": "rdn5065",
    "vehicle_sequence_number": "123456789",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 0,
    "profits": 0.0,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-7i6Qb4hhCZReiP",
    "id_number": "1083441111",
    "reference_code": null,
    "full_name": "Fahad",
    "date_of_birth": null,
    "registration_date": "2025-02-19T21:59:54.333663",
    "mobile": "966501231212",
    "email": null,
    "car_number": "123dmm",
    "vehicle_sequence_number": "1234567",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 3,
    "profits": 27.5,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-3CoBeFLrIzGrwP",
    "id_number": "1083441111",
    "reference_code": null,
    "full_name": "Fahad",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:55:39.290543",
    "mobile": "966581905725",
    "email": null,
    "car_number": "dmm1222",
    "vehicle_sequence_number": "154658243",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 0,
    "profits": 0.0,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-xJ4YmypKuYOZRe",
    "id_number": "1083444444",
    "reference_code": null,
    "full_name": "Slman",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:55:39.295653",
    "mobile": "966586668029",
    "email": null,
    "car_number": "dmm15555",
    "vehicle_sequence_number": "154658254",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 0,
    "profits": 0.0,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-hBYnfSgpQot7BU",
    "id_number": "1083442222",
    "reference_code": null,
    "full_name": "Ali",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:55:39.3479",
    "mobile": "966585853908",
    "email": null,
    "car_number": "dmm1233",
    "vehicle_sequence_number": "154658287",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 1,
    "profits": 13.75,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
];

class LabelTitleDriverWidget extends StatelessWidget {
  const LabelTitleDriverWidget({
    super.key,
    required this.title,
    this.text,
    this.sizeCard = 80,
    this.flex = 1,
  });
  final String title;
  final String? text;
  final double? sizeCard;
  final int? flex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeCard,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: (flex! ~/ 2),
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: flex!,
            child: Text(
              text.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

//

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Text("<-Back"),
    );
  }
}
