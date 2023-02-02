import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent radioGroupWidgetbookComponent = WidgetbookComponent(
  name: 'Radio Group',
  useCases: [
    WidgetbookUseCase(
      name: 'Selected',
      builder: (context) => PreviewWidget(
        child: ZeroRadioGroup(
          size: context.knobs.options(
            options: sizeTypes,
            label: 'Size',
          ),
          onChanged: (val) {},
          value: '1',
          groupValue: '1',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Unselected',
      builder: (context) => PreviewWidget(
        child: ZeroRadioGroup(
          size: context.knobs.options(
            options: sizeTypes,
            label: 'Size',
          ),
          onChanged: (value) {},
          value: '2',
          groupValue: '1',
        ),
      ),
    ),
  ],
);

List<Option<ZeroSizeType>> sizeTypes = [
  const Option(label: 'Small', value: ZeroSizeType.small),
  const Option(label: 'Medium', value: ZeroSizeType.medium),
  const Option(label: 'Large', value: ZeroSizeType.large),
];
