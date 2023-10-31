import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/providers/create_provider_page.dart';
import 'package:admin_dashboard/src/views/providers/edit_provider_page.dart';
import 'package:admin_dashboard/src/views/providers/providersview_test.dart';
import 'package:admin_dashboard/src/views/providers/providerview_test.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  void initState() {
    Provider.of<ProvidersProvider>(context, listen: false).getProviders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final proveedores = Provider.of<ProvidersProvider>(context).proveedores;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: ColorConst.black,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: const Text(
          Strings.providers,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateProdiverPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const Icon(
                EneftyIcons.add_bold,
              ),
            ),
          ),
        ],
      ),
      body: proveedores.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  // ProvidersViewTest(),
                  Column(
                    children: proveedores.map((e) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.nombre,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FxBox.h10,
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConst.blue.withOpacity(.16),
                                      ),
                                      child: const Icon(
                                        EneftyIcons.message_2_bold,
                                        size: 12,
                                        color: ColorConst.blue,
                                      ),
                                    ),
                                    Text(
                                      e.correo.toString(),
                                    ),
                                  ],
                                ),
                                FxBox.h12,
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            ColorConst.success.withOpacity(.16),
                                      ),
                                      child: Icon(
                                        EneftyIcons.call_add_bold,
                                        size: 12,
                                        color: ColorConst.success,
                                      ),
                                    ),
                                    Text(e.telefono.toString()),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProviderPage(
                                                  data: e,
                                                )));
                                  },
                                  child: Icon(
                                    EneftyIcons.edit_outline,
                                    color: ColorConst.warningDark,
                                    size: 20,
                                  ),
                                ),
                                FxBox.h16,
                                InkWell(
                                  onTap: () {
                                    final dialog = AlertDialog(
                                      title: const Text(
                                          '¿Esta seguro de borrar el proveedor?'),
                                      content: Text(
                                          'Borrar definitivamente ${e.nombre}?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('No')),
                                        TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              await Provider.of<
                                                          ProvidersProvider>(
                                                      context,
                                                      listen: false)
                                                  .deleteProvider(e.id);
                                            },
                                            child: const Text('Si')),
                                      ],
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (_) => dialog);
                                  },
                                  child: Icon(
                                    EneftyIcons.trash_outline,
                                    color: ColorConst.errorDark,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    width: MediaQuery.of(context).size.width - 32,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
    );
  }
}
