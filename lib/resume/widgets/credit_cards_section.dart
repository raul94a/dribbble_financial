import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/main.dart';
import 'package:dribbble_financial/utils/material_state_property_helper.dart';
import 'package:dribbble_financial/widgets/dotted_money_text_span.dart';
import 'package:dribbble_financial/widgets/user_circular_avatar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreditCardSection extends StatelessWidget {
  const CreditCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 248, 248, 248),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            _Header(),
            _CreditCard(),
            _BalanceCard(),
            _AddCardButton(),
            _QuickMoneyTransfer()
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
          .copyWith(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Cards',
            style: context.theme.titleMedium,
          ),
          const Row(
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.settings_outlined)),
              IconButton(onPressed: null, icon: Icon(Icons.arrow_back_ios)),
            ],
          )
        ],
      ),
    );
  }
}

class _AddCardButton extends StatelessWidget {
  const _AddCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      height: 45,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: getProperty(Colors.white),
              elevation: getProperty(0),
              shape: getProperty(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(color: Colors.black, width: 1.7)))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle,
                size: 30,
                color: Colors.black,
              ),
              const Gap(15.0),
              Text(
                'Add New Card',
                style: context.theme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(8.0)
          .copyWith(left: 20, right: 20.0, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your balance',
            style: context.theme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 99, 98, 98),
                fontSize: 16),
          ),
          const Gap(10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DottedMoneyTextSpan(quantity: 120088.99),
              Row(
                children: [
                  PercentageRow(
                    rate: 16.60,
                  ),
                  Gap(10),
                  PercentageRow(rate: -10.30)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class PercentageRow extends StatelessWidget {
  const PercentageRow({super.key, required this.rate});
  final double rate;

  @override
  Widget build(BuildContext context) {
    bool isNegative = rate.isNegative;
    return Row(
      children: [
        Icon(
          isNegative ? Icons.arrow_downward : Icons.arrow_upward,
          color: isNegative ? Colors.red : Colors.green,
        ),
        const Gap(5.0),
        Text(
          '${rate.abs()}%',
          style: context.theme.bodyMedium?.copyWith(
            color: isNegative ? Colors.red : Colors.green,
          ),
        )
      ],
    );
  }
}

class _CreditCard extends StatelessWidget {
  const _CreditCard({
    super.key,
  });
  static const cardHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: cardHeight,
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          size: 60,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        Text(
                          'Obisoft',
                          style: context.theme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Text(
                      '**** **** **** 7865',
                      style: context.theme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    const Gap(20),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Jeremy Toe  ',
                        style: context.theme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: '12/24',
                        style: context.theme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
                    const Gap(20)
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                height: cardHeight,
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 20.0),
                child: const Icon(
                  Icons.contactless_outlined,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}

class _QuickMoneyTransfer extends StatelessWidget {
  const _QuickMoneyTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          const QuickTransferHeader(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Expanded(
              child: QuickTransferUserList(),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined))
          ]),
          const Gap(15.0)
        ],
      ),
    );
  }
}

class QuickTransferHeader extends StatelessWidget {
  const QuickTransferHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
          .copyWith(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quick transfers',
            style: context.theme.titleMedium,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

class QuickTransferUserList extends StatelessWidget {
  const QuickTransferUserList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          20,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: UserCircularAvatar(
              radius: 26,
              url: 'https://randomuser.me/api/portraits/men/${index + 1}.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
