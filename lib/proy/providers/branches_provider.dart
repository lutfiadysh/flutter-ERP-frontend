import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/branch.dart';
import 'package:admin_dashboard/proy/models/http/branches_response.dart';
import 'package:flutter/material.dart';

class BranchesProvider extends ChangeNotifier {
  List<Branch> branches = [];

  getBranches() async {
    final respBranches = await BackendApi.httpGet('/sucursales');
    final branchesResponse = BranchesResponse.fromMap(respBranches);

    branches = [...branchesResponse.sucursales];

    notifyListeners();
  }
}
