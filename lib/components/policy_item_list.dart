import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/insurance_policies.dart';

import '../components/policy_item_card.dart';

class PolicyItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final policiesData = Provider.of<InsurancePolicies>(context);
    final policies = policiesData.policies;

    return policies.isEmpty
        ? Column(
            children: [
              Text(
                'Your Insurance Partner',
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 1.2,
                  color: Colors.grey[350],
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Image(
                  image: AssetImage('assets/images/myinsure.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return PolicyItemCard(
                id: '${policies[index].id}',
                insuranceClass:
                    '${policies[index].insuranceClass}'.toUpperCase(),
                description: '${policies[index].description}'.toUpperCase(),
                premium: '${policies[index].premium}',
                status: policies[index].policyEnd.isAfter(DateTime.now())
                    ? 'Active'
                    : 'Inactive',
              );
            },
            itemCount: policies.length,
          );
  }
}
