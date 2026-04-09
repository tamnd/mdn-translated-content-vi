---
title: Quyền riêng tư trên web
slug: Web/Privacy
page-type: landing-page
sidebar: privacy
---

Mọi người dùng website cho nhiều việc quan trọng như ngân hàng, mua sắm, giải trí, và nộp thuế. Khi làm vậy, họ phải chia sẻ thông tin cá nhân với các trang đó. Người dùng đặt một mức độ tin cậy nhất định vào các trang mà họ chia sẻ dữ liệu. Nếu thông tin đó rơi vào tay kẻ xấu, nó có thể bị dùng để khai thác người dùng, ví dụ bằng cách lập hồ sơ, nhắm quảng cáo không mong muốn, hoặc thậm chí đánh cắp danh tính hay tiền của họ.

Trình duyệt hiện đại đã có rất nhiều tính năng để bảo vệ quyền riêng tư của người dùng trên web, nhưng như vậy vẫn chưa đủ. Để tạo ra một trải nghiệm đáng tin cậy và tôn trọng quyền riêng tư, nhà phát triển cần hướng dẫn người dùng trang của họ về các thực hành tốt (và thực thi chúng). Nhà phát triển cũng nên tạo các trang thu thập càng ít dữ liệu từ người dùng càng tốt, sử dụng dữ liệu có trách nhiệm, và truyền cùng lưu trữ dữ liệu một cách an toàn.

Trong bài viết này, chúng ta sẽ:

- Định nghĩa quyền riêng tư và các thuật ngữ liên quan quan trọng.
- Xem xét các tính năng trình duyệt tự động bảo vệ quyền riêng tư của người dùng.
- Tìm hiểu nhà phát triển có thể làm gì để tạo nội dung web tôn trọng quyền riêng tư, giảm thiểu rủi ro thông tin/dữ liệu cá nhân của người dùng bị bên thứ ba thu thập ngoài ý muốn.

## Định nghĩa các thuật ngữ và khái niệm về quyền riêng tư

Trước khi xem các tính năng quyền riêng tư và bảo mật có thể dùng trên web, hãy định nghĩa một số thuật ngữ quan trọng.

### Quyền riêng tư và mối quan hệ với bảo mật

Khó nói về quyền riêng tư mà không nói về bảo mật - hai khái niệm này liên hệ chặt chẽ, và bạn thực sự không thể tạo website tôn trọng quyền riêng tư nếu không có bảo mật tốt. Vì vậy, chúng ta sẽ định nghĩa cả hai.

- **Quyền riêng tư** đề cập đến việc trao cho người dùng quyền kiểm soát cách dữ liệu của họ được thu thập, lưu trữ, và sử dụng, đồng thời không dùng dữ liệu đó một cách vô trách nhiệm. Ví dụ, bạn nên truyền đạt rõ ràng cho người dùng dữ liệu nào bạn đang thu thập, dữ liệu đó sẽ được chia sẻ với ai, và nó sẽ được dùng như thế nào. Người dùng phải có cơ hội đồng ý với các điều khoản sử dụng dữ liệu của bạn, truy cập toàn bộ dữ liệu bạn lưu trữ về họ, và xóa dữ liệu nếu họ không còn muốn bạn giữ nó. Bạn cũng phải tuân thủ chính các điều khoản của mình: không có gì làm xói mòn niềm tin người dùng nhanh bằng việc dữ liệu của họ bị dùng và chia sẻ theo cách họ chưa bao giờ đồng ý. Và điều này không chỉ sai về mặt đạo đức; nó còn có thể trái luật. Nhiều nơi trên thế giới hiện đã có luật bảo vệ quyền riêng tư của người tiêu dùng (ví dụ [GDPR](https://gdpr.eu/) của EU).

- **Bảo mật** là việc giữ cho dữ liệu riêng tư và hệ thống được bảo vệ khỏi truy cập trái phép. Điều này bao gồm cả dữ liệu của công ty (nội bộ) và dữ liệu của người dùng, đối tác (bên ngoài). Sẽ chẳng ích gì nếu bạn có một chính sách quyền riêng tư vững chắc khiến người dùng tin tưởng bạn, trong khi bảo mật yếu và các bên độc hại vẫn có thể đánh cắp dữ liệu.

### Thông tin cá nhân và riêng tư

**Thông tin cá nhân** là bất kỳ thông tin nào mô tả một người dùng. Ví dụ gồm:

- Địa chỉ bưu điện, địa chỉ email, số điện thoại hoặc thông tin liên hệ khác
- Số hộ chiếu, số tài khoản ngân hàng, số thẻ tín dụng, số an sinh xã hội hoặc các mã định danh chính thức khác
- Đặc điểm thể chất như chiều cao, biểu đạt giới, cân nặng, màu tóc hoặc tuổi
- Thông tin sức khỏe như tiền sử bệnh, dị ứng hoặc tình trạng bệnh đang diễn ra
- Tên người dùng, khi có thể liên kết với một cá nhân
- Sở thích, mối quan tâm hoặc các ưu tiên cá nhân khác
- Dữ liệu sinh trắc như dấu vân tay hoặc dữ liệu nhận diện khuôn mặt

**Thông tin riêng tư** là bất kỳ thông tin nào người dùng không muốn chia sẻ công khai và phải được giữ kín (tức là thông tin chỉ được truy cập bởi một nhóm người dùng có quyền hạn nhất định). Một số dữ liệu là riêng tư theo luật (ví dụ dữ liệu y tế), còn một số là riêng tư hơn do sở thích cá nhân.

### Thông tin nhận dạng cá nhân

Tiếp theo phần trên, **thông tin nhận dạng cá nhân** (PII) là thông tin có thể được dùng, toàn phần hoặc một phần, để truy dấu và/hoặc nhận dạng một người cụ thể. Ví dụ, nếu một trang làm rò rỉ danh sách tên và mã zip của người dùng lên mạng, kẻ xấu gần như chắc chắn có thể dùng thông tin này để tìm địa chỉ đầy đủ của họ. Ngay cả khi không xảy ra rò rỉ quy mô lớn, vẫn có thể nhận dạng người dùng qua những cách ít hiển nhiên hơn, như trình duyệt họ dùng, thiết bị họ dùng, các phông chữ cụ thể đã cài đặt, v.v.

### Theo dõi

**Theo dõi** là quá trình ghi lại hoạt động của người dùng trên nhiều website khác nhau. Việc này có thể được làm theo nhiều cách, ví dụ:

- Xem nhiều [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) được đặt trên các trang khác nhau nơi nội dung bên thứ ba được nhúng để suy ra nhiều thông tin về người dùng.
- Xem header {{httpheader("Referer")}} để biết người dùng đã đi từ đâu đến.
- Thêm tham số vào URL của các liên kết trỏ tới (ví dụ trong quảng cáo nhúng dẫn tới trang sản phẩm, hoặc email marketing) có thể tiết lộ cho trang được liên kết biết liên kết xuất phát từ đâu, chiến dịch marketing nào, địa chỉ email hay mã định danh nào của người dùng đã nhấp vào nó, v.v. Quá trình này được gọi là **link decorating**, và tạo ra URL liên kết trông như thế này: `https://example.com/article/?id=62yhgt1a&campaign=902`.
- Theo dõi chuyển hướng, trong đó bộ theo dõi tạm thời (và hầu như không thể nhận ra) chuyển hướng người dùng tới trang của nó để dùng lưu trữ bên thứ nhất nhằm theo dõi người đó qua các website. Điều này cho phép bộ theo dõi vượt qua việc cookie bên thứ ba bị chặn. Ví dụ, nếu bạn vừa đọc một bài đánh giá sản phẩm và muốn nhấp để mua, bạn có thể vô tình đi qua bộ theo dõi chuyển hướng trước, _rồi_ tới nhà bán lẻ. Điều đó có nghĩa là bộ theo dõi được tải như bên thứ nhất, và có thể liên kết dữ liệu theo dõi với các định danh đã lưu trong cookie bên thứ nhất trước khi chuyển tiếp bạn tới nhà bán lẻ.

Dữ liệu theo dõi có thể được dùng để xây dựng hồ sơ về người dùng cùng sở thích và ưu tiên của họ, điều này thường là xấu và gây phiền ở nhiều mức độ. Ví dụ:

- **Quảng cáo nhắm mục tiêu**: Ai cũng từng có trải nghiệm khó chịu khi tìm kiếm một món hàng trên một thiết bị rồi ngay sau đó bị quảng cáo cùng sản phẩm đó tràn ngập trên mọi thiết bị khác.
- **Bán hoặc chia sẻ dữ liệu**: Một số bên thứ ba được biết là thu thập dữ liệu theo dõi rồi bán/chia sẻ nó cho người khác dùng cho nhiều mục đích, như quảng cáo nhắm mục tiêu. Rõ ràng đây là hành vi cực kỳ phi đạo đức và có thể còn bất hợp pháp, tùy nơi nó diễn ra.
- **Thiên lệch qua dữ liệu**: Trong trường hợp tệ nhất, việc chia sẻ dữ liệu có thể khiến người dùng bị bất lợi một cách bất công. Ví dụ, tưởng tượng một công ty bảo hiểm phát hiện các điểm dữ liệu về một khách hàng tiềm năng mà họ không đồng ý chia sẻ, rồi dùng chúng làm lý do để tăng phí bảo hiểm.

### Dấu vân tay trình duyệt

Một quá trình rất gần với theo dõi là **fingerprinting**: điều này cụ thể là việc _nhận dạng_ người dùng bằng cách xây dựng một tập các điểm dữ liệu về họ để phân biệt với người dùng khác. Đây có thể là bất kỳ thứ gì từ nội dung cookie cho tới trình duyệt họ đang dùng và các phông chữ cài cục bộ.

Trình duyệt hiện đại có các bước để ngăn chặn tấn công dựa trên fingerprinting bằng cách либо không cho truy cập thông tin, hoặc, khi thông tin bắt buộc phải được cung cấp, bằng cách đưa vào biến thiên hay "nhiễu" để nó không thể dùng cho mục đích nhận dạng.

Ví dụ, nếu một website hỏi trình duyệt của người dùng về thời gian đã trôi qua, việc so sánh thời gian đó với thời gian mà máy chủ báo có thể hữu ích như một yếu tố fingerprinting. Vì vậy, trình duyệt thường đưa vào một lượng biến thiên nhỏ cho bộ đếm thời gian để chúng kém hữu dụng hơn cho việc nhận dạng hệ thống của người dùng.

> [!NOTE]
> Xem [Fingerprinting](https://web.dev/learn/privacy/fingerprinting/) trên web.dev để biết thêm thông tin hữu ích.

## Tính năng quyền riêng tư do trình duyệt cung cấp

### Bảo vệ tích hợp của trình duyệt

Các trình duyệt hiện đại có rất nhiều tính năng giúp bảo vệ quyền riêng tư của người dùng. Ví dụ, người dùng có thể dùng chế độ duyệt riêng tư, chế độ này hạn chế lượng thông tin được lưu lại trên máy họ. Bạn cũng có thể cấu hình tính năng chống theo dõi trong trình duyệt để chặn cookie bên thứ ba, cookie theo dõi, v.v.

Trình duyệt cũng có thể hạn chế một số nguồn dữ liệu, như vị trí, camera, microphone và các API quyền hạn cao khác, thông qua các cơ chế như Permissions Policy và các prompt xin quyền. Đây là một phần quan trọng của trải nghiệm web tôn trọng quyền riêng tư.

### Các biện pháp giảm thiểu theo dõi

Nhiều trình duyệt cung cấp các tính năng cụ thể để giảm thiểu theo dõi, chẳng hạn như chặn cookie bên thứ ba, hạn chế thời gian tồn tại của trạng thái theo dõi, và giảm khả năng nhận dạng qua fingerprinting. Một số trình duyệt còn chủ động ngăn việc theo dõi chuyển hướng bằng cách xóa dữ liệu liên quan đến các site đóng vai trò trong các "bounce" theo định kỳ.

Tuy nhiên, bạn không nên chỉ trông chờ vào trình duyệt để bảo vệ người dùng. Nhà phát triển vẫn phải làm phần của mình để thu thập ít dữ liệu hơn, dùng dữ liệu có trách nhiệm, và hạn chế việc chia sẻ dữ liệu tới bên thứ ba.

## Điều nhà phát triển có thể làm

### Chỉ thu thập những gì bạn cần

Nguyên tắc tốt nhất là chỉ yêu cầu những dữ liệu thật sự cần cho chức năng của trang. Nếu bạn không cần một thông tin cụ thể để cung cấp dịch vụ, đừng thu thập nó. Nếu bạn cần thu thập, hãy giải thích rõ lý do, cách dùng, ai sẽ truy cập, và người dùng có thể xóa hay xuất dữ liệu của họ như thế nào.

### Minh bạch với người dùng

Hãy thông báo rõ ràng cho người dùng về dữ liệu bạn thu thập, cách bạn lưu trữ, và ai có thể truy cập. Chính sách quyền riêng tư của bạn nên dễ đọc, rõ ràng, và phù hợp với thực hành thực tế của hệ thống. Một chính sách tốt nhưng không được thực hiện nhất quán cũng không có nhiều giá trị.

### Tôn trọng lựa chọn của người dùng

Nếu người dùng từ chối theo dõi hoặc không đồng ý chia sẻ một số dữ liệu, hãy tôn trọng lựa chọn đó. Đừng cố gắng đi đường vòng để thu thập dữ liệu tương tự bằng các cơ chế khác. Nếu bạn cung cấp cài đặt quyền riêng tư, hãy để chúng dễ tìm, dễ hiểu, và dễ thay đổi.

### Chuyển và lưu trữ an toàn

Đảm bảo dữ liệu được truyền qua các kết nối an toàn, lưu trữ an toàn, và chỉ được truy cập bởi những người có thẩm quyền. Dữ liệu nhạy cảm không nên xuất hiện trong URL, nhật ký không được bảo vệ, hoặc các vị trí dễ rò rỉ khác.

### Cẩn trọng với các tài nguyên bên thứ ba

Tất nhiên, việc quản lý quyền riêng tư sẽ dễ dàng nếu bạn chỉ phải lo về các tài nguyên do chính bạn tạo ra (mã, cookie, site, v.v.). Thách thức thực sự đến từ việc site của bạn rất có thể sẽ dùng tài nguyên bên thứ ba. Điều này có thể bao gồm nội dung bên thứ ba được nhúng trong `<iframe>`, thư viện, framework, API, tài nguyên lưu trữ ngoài như ảnh và video, v.v.

Tài nguyên bên thứ ba là một phần thiết yếu của phát triển web hiện đại, và chúng mang lại rất nhiều sức mạnh. Tuy nhiên, bất kỳ tài nguyên bên thứ ba nào bạn cho phép vào site đều có thể có quyền giống như tài nguyên của chính bạn; tất cả phụ thuộc vào cách nó được đưa vào site:

- JavaScript chạy bên trong nội dung bên thứ ba được nhúng vào site qua `<iframe>` sẽ bị tách biệt bởi [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nghĩa là nó sẽ không truy cập được các script và dữ liệu khác được đưa vào ngữ cảnh duyệt cấp cao nhất.
- Tuy nhiên, một script bên thứ ba được đưa trực tiếp vào trang qua phần tử {{htmlelement("script")}} _sẽ_ có thể truy cập các script và dữ liệu khác của bạn, dù nó được lưu trữ trên site của bạn hay site khác. Về thực tế, nó sẽ trở thành mã bên thứ nhất. Một script độc hại được đưa vào theo cách này có thể bí mật đánh cắp dữ liệu người dùng của bạn, ví dụ gửi nó tới một máy chủ bên thứ ba.

Điều quan trọng là phải kiểm tra tất cả tài nguyên bên thứ ba bạn dùng trên site. Hãy bảo đảm bạn biết chúng thu thập dữ liệu gì, gửi yêu cầu gì và tới ai, và chính sách quyền riêng tư của chúng là gì. Chính sách quyền riêng tư được bạn thiết kế cẩn thận sẽ vô dụng nếu bạn dùng một script bên thứ ba vi phạm nó.

> [!NOTE]
> Có nhiều công cụ có thể giúp bạn hình dung site đang gửi những yêu cầu nào, ví dụ [Request Map Generator](https://requestmap.webperf.tools/).

Khi đã kiểm tra xong các tài nguyên bên thứ ba và hiểu chúng đang làm gì, bạn nên cân nhắc các mặt tiêu cực của chúng như một sự đánh đổi với giá trị mà chúng mang lại. Nếu một script bên thứ ba miễn phí và rất hữu ích nhưng thu thập khá nhiều dữ liệu người dùng, bạn có thể:

1. Chấp nhận sự đánh đổi đó, cập nhật chính sách quyền riêng tư để nêu rõ chi tiết, và hy vọng nó không làm ảnh hưởng quá nhiều tới niềm tin của người dùng.
2. Tìm một công cụ bên thứ ba thay thế, ít ngốn dữ liệu hơn.
3. Tự xây dựng công cụ của riêng bạn.

Danh sách sau cung cấp một số mẹo để giảm thiểu rủi ro quyền riêng tư vốn có khi dùng tài nguyên bên thứ ba:

- Khi nhúng tài nguyên bên thứ ba, hãy cân nhắc xem có cách nào đạt hiệu ứng tương tự hoặc gần tương tự với tác động quyền riêng tư thấp hơn hay không. Ví dụ, có thể thú vị khi nhúng trình xem bài đăng mạng xã hội vào site của bạn, nhưng nó có thật sự cần thiết không? Một liên kết tới trang mạng xã hội của bạn có đủ không? Ngoài ra, một số dịch vụ bên thứ ba có các tùy chọn tăng cường quyền riêng tư. Xem, ví dụ, [Embed videos & playlists > Turn on privacy-enhanced mode](https://support.google.com/youtube/answer/171780) của YouTube.
- Khi có thể, bạn nên chặn bên thứ ba nhận header {{httpheader("Referer")}} khi bạn gửi yêu cầu tới họ. Việc này có thể làm khá chi tiết, ví dụ bằng cách thêm [rel="noreferrer"](/en-US/docs/Web/HTML/Reference/Attributes/rel/noreferrer) vào các liên kết ngoài. Hoặc bạn có thể thiết lập ở mức toàn cục cho trang hoặc site, chẳng hạn bằng header {{httpheader("Referrer-Policy")}}.

  > [!NOTE]
  > Xem thêm [Referer header: privacy and security concerns](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns).

- Dùng header HTTP {{httpheader("Permissions-Policy")}} để kiểm soát truy cập tới các "powerful features" của API (như thông báo, dữ liệu định vị, truy cập luồng media từ webcam, v.v.). Điều này hữu ích cho quyền riêng tư vì nó ngăn site bên thứ ba làm những việc bất ngờ với các tính năng này, và người dùng sẽ không bị làm phiền không cần thiết bởi các prompt xin quyền mà họ có thể không hiểu. Bạn cũng có thể kiểm soát việc dùng "powerful features" bên trong các site bên thứ ba được nhúng trong phần tử {{htmlelement("iframe")}} bằng cách chỉ định chính sách quyền trong thuộc tính `allow` của chính `<iframe>`.

  > [!NOTE]
  > Xem thêm [Permissions-Policy guide](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) để biết thêm thông tin và ví dụ, và [permissionspolicy.com](https://www.permissionspolicy.com/) để có các công cụ hữu ích bao gồm trình tạo policy.

- Dùng thuộc tính `sandbox` của {{htmlelement("iframe")}} để cho phép hoặc không cho phép dùng một số tính năng nhất định bên trong nội dung được nhúng trong `<iframe>` - điều này bao gồm các thứ như tải xuống, gửi biểu mẫu, hộp thoại, và scripting.

> [!NOTE]
> Xem [Third parties](https://web.dev/learn/privacy/third-parties/) trên web.dev để biết thêm thông tin hữu ích về kiểm tra và hơn thế nữa.

## Bảo vệ dữ liệu người dùng

Bạn cần bảo đảm dữ liệu người dùng được truyền và lưu trữ an toàn sau khi đã thu thập. Đây là chủ đề nhiều hơn về [bảo mật](/en-US/docs/Web/Security), nhưng vẫn đáng nhắc ở đây - một chính sách quyền riêng tư tốt sẽ vô dụng nếu bảo mật lỏng lẻo và kẻ tấn công có thể đánh cắp dữ liệu từ bạn.

Các mẹo dưới đây cung cấp một số hướng dẫn để bảo vệ dữ liệu người dùng của bạn:

- Bảo mật rất khó làm đúng. Khi triển khai một giải pháp an toàn có liên quan tới thu thập dữ liệu - đặc biệt nếu đó là dữ liệu nhạy cảm như thông tin đăng nhập - thì nên dùng một giải pháp uy tín từ nhà cung cấp được đánh giá cao. Ví dụ, bất kỳ framework phía máy chủ đáng tin nào cũng sẽ có sẵn tính năng để chống các lỗ hổng phổ biến. Bạn cũng có thể cân nhắc dùng một sản phẩm chuyên biệt cho mục đích của mình - ví dụ giải pháp nhà cung cấp danh tính, hoặc dịch vụ khảo sát trực tuyến an toàn.
- Nếu bạn muốn tự xây giải pháp của riêng mình để thu thập dữ liệu người dùng, hãy chắc chắn rằng bạn hiểu mình đang làm gì. Hãy thuê một nhà phát triển phía máy chủ và/hoặc kỹ sư bảo mật có kinh nghiệm để triển khai hệ thống, và bảo đảm nó được kiểm thử kỹ. Dùng {{glossary("multi-factor authentication")}} (MFA) để tăng cường bảo vệ. Cân nhắc dùng một API chuyên dụng như [Web Authentication](/en-US/docs/Web/API/Web_Authentication_API) hoặc [Federated Credential Management](/en-US/docs/Web/API/FedCM_API) để tinh giản phần client-side của ứng dụng.
- Khi thu thập thông tin đăng ký của người dùng, hãy bắt buộc mật khẩu mạnh để thông tin tài khoản của họ không dễ bị đoán. Mật khẩu yếu là một trong những nguyên nhân chính của vi phạm bảo mật. Khuyến khích người dùng dùng trình quản lý mật khẩu để tạo và lưu các mật khẩu phức tạp; như vậy họ không phải lo nhớ chúng, hoặc tạo rủi ro bảo mật bằng cách ghi chúng ra giấy.
- Đừng đưa dữ liệu nhạy cảm vào URL - nếu bên thứ ba chặn được URL (ví dụ qua header {{httpheader("Referer")}}), họ có thể đánh cắp thông tin đó. Hãy dùng yêu cầu `POST` thay vì `GET` để tránh điều này.
- Cân nhắc dùng các công cụ như [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) và [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) để ép buộc một bộ quy tắc sử dụng tính năng trên site của bạn, giúp việc đưa lỗ hổng vào khó hơn. Hãy cẩn thận khi làm điều này - nếu bạn chặn việc dùng một tính năng mà một script bên thứ ba cần để hoạt động, bạn có thể làm hỏng chức năng của site. Đây là điều bạn có thể kiểm tra khi kiểm toán các tài nguyên bên thứ ba của mình (xem [Cẩn trọng với các tài nguyên bên thứ ba](#carefully_manage_third-party_resources)).

## Xem thêm

- [Web security](/en-US/docs/Web/Security)
- [Learn Privacy](https://web.dev/learn/privacy/) trên web.dev
- [Lean Data Practices](https://www.mozilla.org/en-US/about/policy/lean-data/) trên mozilla.org
