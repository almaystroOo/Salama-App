import 'package:meals_app/Models/userModel.dart';
import 'package:scoped_model/scoped_model.dart';
// import './connectedModels.dart';
import '../ScopedModel/connectedModels.dart';

class MainModel extends Model with ConnectedModel, UserModel {}
