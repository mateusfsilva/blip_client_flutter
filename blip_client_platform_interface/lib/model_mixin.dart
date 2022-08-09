import 'package:equatable/equatable.dart';

mixin ModelMixin {
  List<String> get propsNames;

  @override
  String toString() {
    final string = StringBuffer();

    if (this is Equatable || this is EquatableMixin) {
      final props = (this as Equatable).props;

      string.writeln('{');

      props.asMap().entries.forEach((prop) {
        string.write('  ${propsNames[prop.key]}: ');

        if (prop.value is String && prop.value != null) {
          string.writeln('"${prop.value.toString()}",');
        } else {
          string.writeln('${prop.value.toString()},');
        }
      });

      string.writeln('  hashCode: $hashCode');

      string.write('}');
    } else {
      string.write('$runtimeType');
    }

    return string.toString();
  }
}
