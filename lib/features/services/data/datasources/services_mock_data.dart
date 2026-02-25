import 'package:iconsax/iconsax.dart';

List<Map<String, dynamic>> getServiceItems(String serviceTitle) {
    switch (serviceTitle) {
      case 'Transfers':
        return [
          {
            'title': 'Standard Sedan Transfer',
            'description':
                'Private sedan transfer with Meet & Greet support and professional chauffeur service.',
            'price': 'QAR 170',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1502877338535-766e1452684a?auto=format&fit=crop&w=800&q=80', // sedan
            'icon': Iconsax.car,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
          {
            'title': 'Luxury Sedan Transfer',
            'description':
                'Premium luxury sedan transfer with Meet & Greet support and first-class comfort.',
            'price': 'QAR 300',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?auto=format&fit=crop&w=800&q=80', // luxury car
            'icon': Iconsax.car,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
          {
            'title': 'Standard Van Transfer',
            'description':
                'Spacious standard van transfer for families and groups with Meet & Greet support.',
            'price': 'QAR 220',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1563720223185-11003d516935?auto=format&fit=crop&w=800&q=80', // van
            'icon': Iconsax.car,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
          {
            'title': 'Luxury Van Transfer',
            'description':
                'Luxury van transfer with premium comfort, Meet & Greet support, and professional chauffeur.',
            'price': 'QAR 270',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1570129477492-45c003edd2be?auto=format&fit=crop&w=800&q=80', // luxury van / shuttle
            'icon': Iconsax.car,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
          {
            'title': 'Mini Bus Transfer',
            'description':
                'Spacious mini bus transfer for large groups with Meet & Greet support.',
            'price': 'QAR 370',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1593941707882-a5bba53b4c9c?auto=format&fit=crop&w=800&q=80', // minibus
            'icon': Iconsax.car,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
          {
            'title': 'Coach Bus Transfer',
            'description':
                'Luxury coach bus transfer with premium comfort and professional chauffeur.',
            'price': 'QAR 650',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1587574293340-e0011c4e8ecf?auto=format&fit=crop&w=800&q=80', // coach bus
            'icon': Iconsax.car,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
        ];

      case 'Tours':
        return [
          {
            'title': 'Doha City Tour',
            'description': 'Explore Souq Waqif, Katara & The Pearl.',
            'price': 'QAR 450',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1546412414-8035e1776c9a?auto=format&fit=crop&w=800&q=80',
            'icon': Iconsax.map,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
        ];

      case 'Hotels':
        return [
          {
            'title': '5-Star Luxury Hotel Stay',
            'description': 'Premium luxury hotels in prime Doha locations.',
            'price': 'From QAR 500',
            'duration': 'Starting From',
            'image':
                'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
            'icon': Iconsax.building_4,
            'badges': [
              {'icon': Iconsax.crown, 'label': 'Luxury'},
              {'icon': Iconsax.clock, 'label': '40 mins'},
            ],
          },
        ];

      default:
        return [];
    }
  }