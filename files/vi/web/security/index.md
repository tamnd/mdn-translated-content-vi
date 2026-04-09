---
title: Bảo mật trên web
short-title: Security
slug: Web/Security
page-type: landing-page
sidebar: security
---

Website chứa nhiều loại thông tin khác nhau. Một phần là thông tin không nhạy cảm, ví dụ nội dung hiển thị trên các trang công khai. Một phần là thông tin nhạy cảm, ví dụ tên người dùng, mật khẩu, và thông tin ngân hàng của khách hàng, hoặc các thuật toán nội bộ và thông tin sản phẩm riêng tư.

Thông tin nhạy cảm cần được bảo vệ, và đó là trọng tâm của bảo mật web. Nếu thông tin đó rơi vào tay kẻ xấu, nó có thể được dùng để:

- Làm công ty bất lợi về cạnh tranh bằng cách chia sẻ thông tin của họ với đối thủ.
- Làm gián đoạn hoặc chiếm quyền dịch vụ của họ, một lần nữa gây ra các vấn đề nghiêm trọng cho hoạt động.
- Đặt [quyền riêng tư](/en-US/docs/Web/Privacy) của khách hàng vào rủi ro, khiến họ dễ bị lập hồ sơ, nhắm mục tiêu, mất dữ liệu, đánh cắp danh tính, hoặc thậm chí tổn thất tài chính.

Trình duyệt hiện đại đã có nhiều tính năng để bảo vệ an ninh của người dùng trên web, nhưng như vậy vẫn chưa đủ. Để tạo ra trải nghiệm đáng tin cậy và tôn trọng bảo mật, nhà phát triển cũng cần dùng thực hành tốt nhất và viết mã cẩn thận để bảo đảm website an toàn. Ngay cả các lỗi đơn giản trong mã cũng có thể tạo ra lỗ hổng mà kẻ xấu khai thác để đánh cắp dữ liệu và giành quyền kiểm soát trái phép đối với dịch vụ.

Bài viết này cung cấp phần giới thiệu về bảo mật web, bao gồm thông tin khái niệm giúp bạn hiểu các lỗ hổng website và các hướng dẫn thực hành về cách bảo mật chúng.

## Mối quan hệ giữa bảo mật và quyền riêng tư

Bảo mật và quyền riêng tư là những chủ đề khác nhau nhưng liên quan chặt chẽ. Đáng để biết sự khác nhau giữa chúng và cách chúng liên hệ với nhau.

- **Bảo mật** là việc giữ cho dữ liệu riêng tư và hệ thống được bảo vệ khỏi truy cập trái phép. Điều này bao gồm cả dữ liệu của công ty (nội bộ) và dữ liệu của người dùng, đối tác (bên ngoài).

- **Quyền riêng tư** là việc trao cho người dùng quyền kiểm soát cách dữ liệu của họ được thu thập, lưu trữ, và sử dụng, đồng thời bảo đảm dữ liệu đó không bị dùng vô trách nhiệm. Ví dụ, bạn nên cho người dùng biết dữ liệu nào bạn đang thu thập từ họ, dữ liệu đó sẽ được chia sẻ với những bên nào, và nó sẽ được dùng như thế nào. Người dùng phải được cho cơ hội đồng ý với chính sách quyền riêng tư của bạn, có quyền truy cập dữ liệu mà bạn lưu trữ về họ, và xóa dữ liệu đó nếu họ chọn.

Bảo mật tốt là điều thiết yếu cho quyền riêng tư tốt. Bạn có thể làm theo tất cả lời khuyên được liệt kê trong hướng dẫn [Quyền riêng tư trên web](/en-US/docs/Web/Privacy) của chúng tôi, nhưng hành xử có trách nhiệm và có một chính sách quyền riêng tư vững chắc cũng vô ích nếu site của bạn không an toàn và kẻ tấn công vẫn có thể đơn giản đánh cắp dữ liệu.

## Tính năng bảo mật do trình duyệt cung cấp

Trình duyệt web tuân theo một mô hình bảo mật nghiêm ngặt, thực thi bảo mật chặt chẽ cho nội dung, các kết nối giữa trình duyệt và máy chủ, và việc truyền dữ liệu. Phần này xem xét các tính năng làm nền cho mô hình này.

### Chính sách cùng nguồn gốc và CORS

[Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) là một cơ chế bảo mật nền tảng của web, hạn chế cách một tài liệu hoặc script được tải từ một {{Glossary("origin")}} có thể tương tác với tài nguyên từ một origin khác. Nó giúp cô lập các tài liệu có khả năng độc hại, giảm các vector tấn công có thể xảy ra.

Nói chung, tài liệu từ một origin không thể gửi yêu cầu tới các origin khác. Điều này hợp lý vì bạn không muốn các site can thiệp vào nhau và truy cập dữ liệu trái phép.

Tuy nhiên, trong một số trường hợp bạn có thể muốn nới lỏng hạn chế này; ví dụ, nếu bạn có nhiều website tương tác với nhau, bạn có thể cho phép chúng yêu cầu tài nguyên của nhau bằng [`fetch()`](/en-US/docs/Web/API/Window/fetch). Điều này có thể được cho phép bằng [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS), một cơ chế dựa trên HTTP header cho phép máy chủ chỉ ra những origin nào (domain, scheme, hoặc port) khác với chính nó mà trình duyệt nên cho phép tải tài nguyên từ đó.

### Mô hình HTTP cho giao tiếp

Giao thức [HTTP](/en-US/docs/Web/HTTP) được trình duyệt và máy chủ web dùng để giao tiếp với nhau, yêu cầu tài nguyên, cung cấp phản hồi (ví dụ, cung cấp tài nguyên được yêu cầu hoặc nêu rõ vì sao một yêu cầu thất bại), và cung cấp các tính năng bảo mật cho giao tiếp đó.

Transport Layer Security (TLS) cung cấp bảo mật và quyền riêng tư bằng cách mã hóa dữ liệu trong quá trình truyền qua mạng và là công nghệ đứng sau giao thức [HTTPS](/en-US/docs/Glossary/HTTPS). TLS tốt cho quyền riêng tư vì nó ngăn bên thứ ba chặn dữ liệu được truyền và dùng nó một cách độc hại.

Tất cả trình duyệt đều đang tiến tới việc yêu cầu HTTPS theo mặc định; trên thực tế điều này gần như đã là mặc định vì bạn không thể làm được nhiều việc trên web nếu không có giao thức này.

Các chủ đề liên quan:

- [Transport layer security](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security) (TLS)
  - : Giao thức TLS là tiêu chuẩn để cho phép hai ứng dụng hoặc thiết bị kết nối mạng trao đổi thông tin một cách riêng tư và bền vững. Các ứng dụng dùng TLS có thể chọn tham số bảo mật, và những tham số này có thể ảnh hưởng rất lớn tới độ an toàn và độ tin cậy của dữ liệu.
- [HTTP Strict-Transport-Security](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security)
  - : Header HTTP `Strict-Transport-Security` cho phép website chỉ định rằng nó chỉ có thể được truy cập bằng HTTPS.
- [Certificate Transparency](/en-US/docs/Web/Security/Defenses/Certificate_Transparency)
  - : Certificate Transparency (CT) là một khuôn khổ mở được thiết kế để bảo vệ chống và giám sát việc cấp chứng chỉ sai. Các chứng chỉ mới được cấp sẽ được "ghi log" vào các CT log công khai, thường là độc lập. Chúng cung cấp hồ sơ chỉ-ghi-thêm, được đảm bảo bằng mật mã, về các chứng chỉ TLS đã cấp.
- [Mixed content](/en-US/docs/Web/Security/Defenses/Mixed_content)
  - : Một trang HTTPS bao gồm nội dung được lấy bằng HTTP [cleartext](/en-US/docs/Glossary/Plaintext) được gọi là trang **mixed content**. Những trang như vậy chỉ được mã hóa một phần, khiến nội dung không mã hóa có thể bị các trình nghe lén và kẻ tấn công trung gian truy cập.

### Secure contexts và quyền tính năng

Trình duyệt kiểm soát việc sử dụng các "powerful features" theo nhiều cách khác nhau. Những "powerful features" này bao gồm việc tạo thông báo hệ thống trên website, dùng webcam của người dùng để truy cập luồng media, thao tác GPU hệ thống, và dùng thanh toán web. Nếu site chỉ có thể dùng các API điều khiển những tính năng này mà không bị hạn chế, nhà phát triển độc hại có thể cố làm như sau:

- Làm phiền người dùng bằng các thông báo không cần thiết và các yếu tố UI khác.
- Bật webcam của họ mà không cảnh báo để theo dõi.
- Làm đầy trình duyệt/hệ thống để tạo các cuộc tấn công {{glossary("denial of service", "từ chối dịch vụ")}} (DoS).
- Đánh cắp dữ liệu hoặc tiền.

Những "powerful features" này được kiểm soát theo các cách sau:

- Việc sử dụng những tính năng như vậy chỉ được phép trong [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts). Một secure context là một {{domxref("Window", "window")}} hoặc {{domxref("WorkerGlobalScope", "worker")}} mà ở đó có thể tin cậy hợp lý rằng nội dung đã được truyền đi một cách an toàn (qua HTTPS/TLS). Trong secure context, khả năng giao tiếp với các ngữ cảnh **không** an toàn bị hạn chế. Secure context cũng giúp ngăn [man-in-the-middle attackers](https://en.wikipedia.org/wiki/Man-in-the-middle_attack) truy cập các powerful feature.

  Để xem danh sách các tính năng nền tảng web chỉ khả dụng trong secure context, xem [Features restricted to secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts).

- Việc sử dụng các tính năng này được gác lại sau một hệ thống quyền người dùng: người dùng phải chủ động chọn đồng ý cho phép truy cập những tính năng như vậy, nghĩa là chúng không thể được dùng tự động. Các yêu cầu quyền người dùng xảy ra tự động, và bạn có thể truy vấn trạng thái quyền API bằng [Permissions API](/en-US/docs/Web/API/Permissions_API).

- Một số tính năng trình duyệt khác chỉ có thể được dùng khi phản hồi một hành động của người dùng như nhấp nút, nghĩa là chúng phải được gọi từ bên trong một trình xử lý sự kiện phù hợp. Điều này được gọi là **transient activation**. Xem [Features gated by user activation](/en-US/docs/Web/Security/Defenses/User_activation) để biết thêm thông tin.

## Cân nhắc bảo mật ở mức cao

Có rất nhiều khía cạnh của bảo mật web cần được nghĩ tới ở phía máy chủ và phía client. Phần này tập trung chủ yếu vào các cân nhắc bảo mật phía client. Bạn có thể tìm thấy một bản tóm tắt hữu ích về bảo mật từ góc nhìn phía máy chủ, bao gồm cả mô tả về các cuộc tấn công phổ biến cần lưu ý, tại [Website security](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security) (thuộc mô-đun học [Server-side website programming](/en-US/docs/Learn_web_development/Extensions/Server-side) của chúng tôi).

### Lưu dữ liệu phía client một cách có trách nhiệm

Xử lý dữ liệu có trách nhiệm chủ yếu liên quan tới việc giảm bớt sử dụng [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) và cẩn thận với dữ liệu bạn lưu và chia sẻ với chúng. Theo truyền thống, nhà phát triển web đã dùng cookie để lưu đủ loại dữ liệu, và kẻ tấn công rất dễ khai thác thói quen này. Kết quả là trình duyệt đã bắt đầu giới hạn những gì bạn có thể làm với cookie giữa các site, với mục tiêu cuối cùng là loại bỏ hoàn toàn quyền truy cập vào chúng trong tương lai.

Bạn nên chuẩn bị cho việc loại bỏ cookie giữa các site bằng cách hạn chế lượng hoạt động theo dõi mà bạn phụ thuộc vào và/hoặc bằng cách triển khai khả năng lưu giữ thông tin mong muốn theo những cách khác. Xem [Transitioning from third-party cookies](/en-US/docs/Web/Privacy/Guides/Third-party_cookies#transitioning_from_third-party_cookies) để biết thêm thông tin.

### Bảo vệ danh tính người dùng và quản lý đăng nhập

Khi triển khai một giải pháp an toàn có liên quan tới việc thu thập dữ liệu, đặc biệt nếu dữ liệu là nhạy cảm như thông tin đăng nhập, nên dùng một giải pháp uy tín từ nhà cung cấp có tên tuổi. Ví dụ, bất kỳ framework phía máy chủ đáng tin nào cũng sẽ có các tính năng tích hợp để chống các lỗ hổng phổ biến. Bạn cũng có thể cân nhắc dùng một sản phẩm chuyên biệt cho mục đích của mình - chẳng hạn giải pháp nhà cung cấp danh tính, hoặc dịch vụ khảo sát trực tuyến an toàn.

Nếu bạn muốn tự xây dựng giải pháp riêng để thu thập dữ liệu người dùng, hãy chắc chắn rằng bạn hiểu mình đang làm gì. Hãy thuê một nhà phát triển phía máy chủ và/hoặc kỹ sư bảo mật có kinh nghiệm để triển khai hệ thống, và bảo đảm nó được kiểm thử kỹ lưỡng. Dùng {{glossary("multi-factor authentication")}} (MFA) để có bảo vệ tốt hơn. Cân nhắc dùng API chuyên dụng như [Web Authentication](/en-US/docs/Web/API/Web_Authentication_API) hoặc [Federated Credential Management](/en-US/docs/Web/API/FedCM_API) để tinh giản phần client-side của ứng dụng.

Khi thu thập thông tin đăng ký người dùng, hãy thực thi mật khẩu mạnh để chi tiết tài khoản của người dùng không dễ bị đoán ra. Mật khẩu yếu là một trong những nguyên nhân chính của vi phạm bảo mật. Khuyến khích người dùng dùng trình quản lý mật khẩu để tạo và lưu các mật khẩu phức tạp; theo cách đó họ sẽ không phải lo nhớ chúng, hoặc tạo rủi ro bảo mật bằng cách ghi chúng ra.

Đừng đưa dữ liệu nhạy cảm vào URL - nếu bên thứ ba chặn được URL (ví dụ qua header {{httpheader("Referer")}}), họ có thể đánh cắp thông tin đó. Hãy dùng yêu cầu `POST` thay vì `GET` để tránh điều này.

Cân nhắc dùng các công cụ như [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) và [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) để thực thi một bộ quy tắc sử dụng tính năng trên site của bạn, khiến việc đưa lỗ hổng vào khó hơn. Hãy cẩn thận khi làm điều này - nếu bạn chặn việc dùng một tính năng mà script bên thứ ba cần để hoạt động, bạn có thể vô tình làm hỏng chức năng của site.

### Vân tay trình duyệt

Trước đây chúng ta đã nói về fingerprinting. Trên web, đây là quá trình nhận dạng người dùng bằng cách thu thập một tập các điểm dữ liệu về họ để phân biệt họ với người khác.

Trình duyệt hiện đại cố gắng hạn chế kỹ thuật này bằng cách:

- Không cho truy cập một số thông tin nhạy cảm.
- Thêm nhiễu vào dữ liệu như timer để làm chúng kém hữu ích cho việc nhận dạng.

### Bảo vệ nội dung và kết nối

Các trình duyệt buộc dùng HTTPS để bảo vệ dữ liệu trong quá trình truyền, và cùng với CSP, HSTS, và các chính sách khác, chúng giúp ngăn các cuộc tấn công như MITM, injection, và mixed content.

### Kiểm soát đặc quyền

Nhà phát triển nên dùng secure context, quyền người dùng, và transient activation để hạn chế việc sử dụng các tính năng có rủi ro cao. Chỉ yêu cầu quyền khi thật sự cần thiết, và tránh làm phiền người dùng bằng các prompt không cần thiết.

## Các cân nhắc ở mức cao dành cho bảo mật

Có nhiều khía cạnh khác cần cân nhắc trên cả server và client:

- Lưu trữ và truyền dữ liệu một cách an toàn.
- Dùng HTTPS cho toàn bộ site.
- Kiểm toán các tài nguyên bên thứ ba.
- Dùng mã hóa mạnh và xác thực người dùng cẩn thận.
- Dùng CSP, Permissions Policy, và các cơ chế tương tự để giảm thiểu bề mặt tấn công.

## Tấn công phổ biến

Một số cuộc tấn công web phổ biến mà bạn cần biết bao gồm:

- XSS
- CSRF
- Clickjacking
- IDOR
- MITM
- Phishing
- Prototype pollution
- SSRF
- Subdomain takeover
- Supply chain attacks

## Thực hành tốt nhất

- Bảo vệ dữ liệu người dùng và danh tính của họ.
- Dùng HTTPS cho mọi trang.
- Kiểm tra và giới hạn dữ liệu của bên thứ ba.
- Dùng CSP và Permissions Policy khi phù hợp.
- Tránh để lộ thông tin nhạy cảm qua URL.

## Xem thêm

- [Privacy on the web](/en-US/docs/Web/Privacy)
- [Learn: Website security](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security)
- [Mozilla Security Blog](https://blog.mozilla.org/security/)
- [OWASP Cheat Sheet series](https://cheatsheetseries.owasp.org/index.html)
