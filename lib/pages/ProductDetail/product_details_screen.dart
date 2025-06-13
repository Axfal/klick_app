import 'widgets/image_carousel.dart';
import 'widgets/ratings_widget.dart';
import 'widgets/product_info.dart';
import 'widgets/recommendations.dart';
import 'package:klik_app/constants/exports.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _tabScrollController = ScrollController();

  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _ratingsKey = GlobalKey();
  final GlobalKey _productDetailsKey = GlobalKey();
  final GlobalKey _recommendationsKey = GlobalKey();
  final GlobalKey _aboutProductKey = GlobalKey();

  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _scrollController.addListener(_syncTabWithScroll);
  }

  void _syncTabWithScroll() {
    if (_isScrolling) return;

    final RenderBox? overviewBox =
        _overviewKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? ratingsBox =
        _ratingsKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? detailsBox =
        _productDetailsKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? recommendationsBox =
        _recommendationsKey.currentContext?.findRenderObject() as RenderBox?;

    if (overviewBox == null ||
        ratingsBox == null ||
        detailsBox == null ||
        recommendationsBox == null) {
      return;
    }

    double offset = _scrollController.offset;
    double overviewPosition = overviewBox.localToGlobal(Offset.zero).dy;
    double ratingsPosition = ratingsBox.localToGlobal(Offset.zero).dy;
    double detailsPosition = detailsBox.localToGlobal(Offset.zero).dy;
    double recommendationsPosition = recommendationsBox
        .localToGlobal(Offset.zero)
        .dy;

    int newIndex = _tabController.index;

    if (offset >= overviewPosition) newIndex = 0;
    if (offset >= ratingsPosition) newIndex = 1;
    if (offset >= detailsPosition) newIndex = 2;
    if (offset >= recommendationsPosition) newIndex = 3;

    if (_tabController.index != newIndex) {
      _tabController.animateTo(newIndex);
      _scrollToTab(newIndex);
    }
  }

  Future<void> _scrollToSection(GlobalKey key) async {
    if (key.currentContext == null) return;

    _isScrolling = true;
    await Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _isScrolling = false;
  }

  /// **Scrolls the TabBar automatically when a tab is selected**
  void _scrollToTab(int index) {
    double tabWidth = 100.0.w; // Approximate width of each tab
    double targetScroll =
        index * tabWidth -
        (MediaQuery.of(context).size.width / 2) +
        (tabWidth / 2);

    _tabScrollController.animateTo(
      targetScroll,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const CustomAppBar(title: 'Product Details'),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    key: _overviewKey,
                    title: "Overview",
                    child: _buildImageCarousel(),
                  ),
                  _buildSection(
                    key: _aboutProductKey,
                    title: "About Product",
                    child: _buildAboutProduct(),
                  ),

                  _buildSection(
                    key: _productDetailsKey,
                    title: "Product Details",
                    child: _buildProductInfo(),
                  ),
                  _buildSection(
                    key: _ratingsKey,
                    title: "Ratings & Reviews",
                    child: _buildRatings(),
                  ),

                  _buildSection(
                    key: _recommendationsKey,
                    title: "Recommendations",
                    child: _buildRecommendations(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _tabScrollController, // Attach Scroll Controller
        child: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primaryColor,
          onTap: (index) {
            _scrollToSection(_getKeyForIndex(index));
            _scrollToTab(index);
          },
          tabs: const [
            Tab(child: FittedBox(child: Text("Overview"))),
            Tab(child: FittedBox(child: Text("Ratings & Reviews"))),
            Tab(child: FittedBox(child: Text("Product Details"))),
            Tab(child: FittedBox(child: Text("Recommendations"))),
          ],
        ),
      ),
    );
  }

  GlobalKey _getKeyForIndex(int index) {
    switch (index) {
      case 0:
        return _overviewKey;
      case 1:
        return _ratingsKey;
      case 2:
        return _productDetailsKey;
      case 3:
        return _recommendationsKey;
      default:
        return _overviewKey;
    }
  }

  Widget _buildSection({
    required GlobalKey key,
    required String title,
    required Widget child,
  }) {
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          child,
        ],
      ),
    );
  }

  _buildImageCarousel() => ImageCarousel(
    imageUrls: [
      'assets/images/product1.png',
      'assets/images/product1.png',
      'assets/images/product1.png',
    ],
  );
  _buildAboutProduct() => AboutProduct(
    product: Product(
      productName:
          'NitroBlaze XtremeForce Velocity Runners – PowerGrip /nick first copy',
      price: 1795,
      discountedPercent: 25, // No discount shown
      rating: 4.0, // Not shown
      ratingCount: 0,
      soldCount: 25,
      showFreeDelivery: true,
      showLimitedTimeOffer: false,
      sku: 'AFP-000506275',
      deliveryTime: '2-3 Days Delivery', // Add this field in Product if missing
    ),
  );

  _buildRatings() => const RatingsWidget();

  _buildProductInfo() => const ProductInfo();

  _buildRecommendations() => const Recommendations();

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _tabScrollController.dispose();
    super.dispose();
  }
}
