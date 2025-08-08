import 'package:flutter/material.dart';
import 'package:promptura/services/settings.dart' show DarkTheme;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.primaryBackground,
      body: CustomScrollView(
        slivers: [
          // Collapsing header with welcome text and typing area
          SliverAppBar(
            backgroundColor: DarkTheme.primaryBackground,
            expandedHeight: 320.0,
            floating: false,
            pinned: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // Welcome text (Claude.ai style)
                    const Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'How can I help you today?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    // Beautiful typing area
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Generate ghibli art from...',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(20),
                          suffixIcon: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Cards section
          SliverPadding(
            padding: const EdgeInsets.all(24.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85, // Taller cards for thumbnail + text
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildCard(context, index);
                },
                childCount: 12, // Show 12 cards for demonstration
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    final promptData = _getPromptData(index);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: InkWell(
        onTap: () {
          // Handle prompt selection - could populate the typing area with this prompt
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big thumbnail area showing prompt preview
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      promptData['color'].withOpacity(0.2),
                      promptData['color'].withOpacity(0.05),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category icon and label
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: promptData['color'].withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              promptData['icon'],
                              color: promptData['color'],
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            promptData['category'],
                            style: TextStyle(
                              color: promptData['color'],
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Prompt preview text
                      Expanded(
                        child: Text(
                          promptData['preview'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                            height: 1.4,
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Text content area
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Primary text (prompt title)
                    Text(
                      promptData['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    // Secondary text (prompt description)
                    Text(
                      promptData['description'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getPromptData(int index) {
    final promptLibrary = [
      {
        'title': 'Code Review Assistant',
        'description': 'Get detailed code reviews with suggestions',
        'category': 'CODING',
        'preview':
            'Please review this code and provide feedback on:\n• Code structure and organization\n• Performance optimizations\n• Best practices...',
        'icon': Icons.code_outlined,
        'color': const Color(0xFF10B981),
      },
      {
        'title': 'Creative Story Writer',
        'description': 'Generate engaging stories with custom themes',
        'category': 'CREATIVE',
        'preview':
            'Write a compelling short story about [TOPIC] that includes:\n• Vivid character development\n• Engaging plot twists\n• Rich descriptions...',
        'icon': Icons.auto_stories,
        'color': const Color(0xFF6366F1),
      },
      {
        'title': 'Email Professional',
        'description': 'Craft professional emails for any situation',
        'category': 'BUSINESS',
        'preview':
            'Compose a professional email for [SITUATION] that:\n• Maintains appropriate tone\n• Includes clear action items\n• Follows business etiquette...',
        'icon': Icons.email_outlined,
        'color': const Color(0xFF3B82F6),
      },
      {
        'title': 'Language Tutor',
        'description': 'Learn languages with interactive conversations',
        'category': 'EDUCATION',
        'preview':
            'Act as a [LANGUAGE] tutor and help me practice:\n• Basic conversation skills\n• Grammar corrections\n• Cultural context explanations...',
        'icon': Icons.translate,
        'color': const Color(0xFFEC4899),
      },
      {
        'title': 'Research Analyst',
        'description': 'Comprehensive research with citations',
        'category': 'RESEARCH',
        'preview':
            'Research [TOPIC] and provide:\n• Key findings and statistics\n• Multiple perspectives\n• Reliable source citations\n• Summary of implications...',
        'icon': Icons.search,
        'color': const Color(0xFF06B6D4),
      },
      {
        'title': 'Marketing Copy',
        'description': 'Create compelling marketing content',
        'category': 'MARKETING',
        'preview':
            'Create marketing copy for [PRODUCT/SERVICE] that:\n• Highlights key benefits\n• Addresses target audience pain points\n• Includes strong call-to-action...',
        'icon': Icons.campaign,
        'color': const Color(0xFFF59E0B),
      },
      {
        'title': 'Interview Prep Coach',
        'description': 'Practice interviews with realistic scenarios',
        'category': 'CAREER',
        'preview':
            'Help me prepare for a [ROLE] interview by:\n• Asking common interview questions\n• Providing feedback on answers\n• Suggesting improvements...',
        'icon': Icons.psychology,
        'color': const Color(0xFF8B5CF6),
      },
      {
        'title': 'Recipe Creator',
        'description': 'Custom recipes based on your ingredients',
        'category': 'COOKING',
        'preview':
            'Create a recipe using [INGREDIENTS] that:\n• Provides step-by-step instructions\n• Includes cooking times and tips\n• Suggests variations...',
        'icon': Icons.restaurant_menu,
        'color': const Color(0xFFDC2626),
      },
      {
        'title': 'Study Guide Maker',
        'description': 'Comprehensive study materials for any topic',
        'category': 'EDUCATION',
        'preview':
            'Create a study guide for [SUBJECT] that includes:\n• Key concepts and definitions\n• Practice questions\n• Memory techniques\n• Summary charts...',
        'icon': Icons.menu_book,
        'color': const Color(0xFF84CC16),
      },
      {
        'title': 'Brainstorm Buddy',
        'description': 'Creative ideation and problem solving',
        'category': 'CREATIVE',
        'preview':
            'Help me brainstorm ideas for [PROJECT] by:\n• Generating multiple creative concepts\n• Exploring different approaches\n• Asking thought-provoking questions...',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFFEAB308),
      },
      {
        'title': 'Fitness Planner',
        'description': 'Personalized workout and nutrition plans',
        'category': 'HEALTH',
        'preview':
            'Design a fitness plan for [GOALS] that includes:\n• Customized workout routines\n• Nutrition recommendations\n• Progress tracking methods...',
        'icon': Icons.fitness_center,
        'color': const Color(0xFFF97316),
      },
      {
        'title': 'Travel Planner',
        'description': 'Detailed itineraries and travel advice',
        'category': 'TRAVEL',
        'preview':
            'Plan a [DURATION] trip to [DESTINATION] with:\n• Day-by-day itinerary\n• Budget recommendations\n• Local tips and cultural insights\n• Booking suggestions...',
        'icon': Icons.flight_takeoff,
        'color': const Color(0xFF059669),
      },
    ];

    return promptLibrary[index % promptLibrary.length];
  }
}
