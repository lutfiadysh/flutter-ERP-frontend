import 'package:admin_dashboard/proy/models/branch.dart';
import 'package:admin_dashboard/proy/providers/branches_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  Branch? selectedBranch;
  List<Branch> listBranch = [];
  BranchesProvider? provider;
  @override
  void initState() {
    super.initState();

    Provider.of<StocksProvider>(context, listen: false).getStocks();

    Provider.of<BranchesProvider>(context, listen: false)
        .getBranches()
        .then((_) {
      listBranch =
          Provider.of<BranchesProvider>(context, listen: false).branches;
      if (listBranch.isNotEmpty) {
        setState(() {
          selectedBranch = listBranch.first;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final stocks = Provider.of<StocksProvider>(context).stocks;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
          ),
          titleSpacing: 0,
          centerTitle: false,
          title: const Text(
            Strings.stocks,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: listBranch.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    FxBox.h12,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: listBranch.map((e) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedBranch = e;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              decoration: BoxDecoration(
                                color: selectedBranch == e
                                    ? ColorConst.blue.withOpacity(.2)
                                    : null,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: selectedBranch == e
                                      ? ColorConst.blue
                                      : Colors.grey,
                                ),
                              ),
                              child: Text(
                                e.municipio,
                                style: TextStyle(
                                    color: selectedBranch == e
                                        ? ColorConst.blue
                                        : Colors.grey),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    FxBox.h12,
                    if (selectedBranch != null)
                      Column(
                          children: stocks
                              .where((stock) =>
                                  stock.sucursal.id == selectedBranch!.id)
                              .toList()
                              .map((stock) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: stock.producto.img != null
                                        ? DecorationImage(
                                            image: NetworkImage(
                                                stock.producto.img.toString()),
                                            fit: BoxFit.cover,
                                          )
                                        : const DecorationImage(
                                            image:
                                                AssetImage('assets/loader.gif'),
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: Text(
                                  stock.producto.nombre,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Cajas :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.cantidadCajas}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Piezas :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.cantidadPiezas}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Cajas salientes :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.reservadoCajas}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Piezas salientes :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.reservadoPiezas}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Cajas entrantes :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.entranteCajas}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Piezas entrantes :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.entrantePiezas}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Punto de reorden :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.puntoReorden}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Pedido EOQ :",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " ${stock.eoq}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList()),
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
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
