import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syspotec_app/core/blocs/home/home_bloc.dart';
import 'package:syspotec_app/core/models/file_model.dart';
import 'package:syspotec_app/gui/app_styles.dart';
import 'package:syspotec_app/gui/drawers/home_drawer.dart';
import 'package:syspotec_app/gui/utils/utils.dart';
import 'package:syspotec_app/gui/widgets/header_section_widget.dart';
import 'package:syspotec_app/gui/widgets/loader_app.dart';
import 'package:syspotec_app/gui/widgets/primary_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();

    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.getContracts();
  }

  @override
  Widget build(BuildContext context) {

    Size media = MediaQuery.of(context).size;

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      drawer: HomeDrawer(scaffoldKey: scaffoldKey),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.contract != null) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSectionWidget(
                    textHeader: "Contratos pendientes", 
                    widget: SizedBox()
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.contract!.length,
                    itemBuilder: (context, index) {
                      return state.contract![index].state.id == 3 ? Container(
                        margin: const EdgeInsets.all( 20.0 ),
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("La empresa ${state.contract![index].contract.company.name} requiere que firmes el siguiente contrato.", style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 17.0 ),),
                            const SizedBox(height: 10.0),
                            Text("Nombre de contrato: ${state.contract![index].contract.name}", textAlign: TextAlign.left, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 15.0 ),),
                            const SizedBox(height: 10.0),
                            SizedBox(
                              width: media.width * .5,
                              child: PrimaryButton(
                                text: "Firmar",
                                onPressed: () {
                                  final file = FileModel(id: 1, fileName: "contract", mimeType: "application/pdf", datos: state.contract![index].contract.contractFile);
                                  Utils.base64ToPdf(file.datos, file.fileName, 'pdf');
                                } 
                              ),
                            )
                          ],
                        ),
                      ) : const SizedBox();
                    }
                  ),
                ],
              )
            );

          } else {
            return const LoaderApp();
          }
        },
      )

    );
  }
}