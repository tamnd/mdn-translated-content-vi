---
title: Topics API
slug: Web/API/Topics_API
page-type: web-api-overview
status:
  - deprecated
  - non-standard
browser-compat: api.Document.browsingTopics
---

{{DefaultAPISidebar("Topics API")}}{{non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi hai nhà cung cấp trình duyệt. Xem phần [Vị trí tiêu chuẩn](#standards_positions) bên dưới để biết chi tiết.

> [!NOTE]
> Cần có [quy trình đăng ký](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) để sử dụng Topics API trong ứng dụng của bạn. Xem phần [Đăng ký](#enrollment) để biết chi tiết về các tính năng con nào bị giới hạn bởi đăng ký.

**Topics API** cung cấp cơ chế cho các nhà phát triển triển khai các trường hợp sử dụng như **quảng cáo dựa trên sở thích (IBA)** dựa trên các chủ đề được thu thập bởi trình duyệt khi người dùng điều hướng các trang khác nhau, thay vì được thu thập bởi nhà phát triển bằng cách theo dõi hành trình của người dùng trên các trang web khác nhau với [cookie của bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies).

## Khái niệm và cách sử dụng

Một cơ chế quảng cáo điển hình trên web liên quan đến người dùng truy cập các trang web **nhà xuất bản** sử dụng nền tảng công nghệ quảng cáo (ad tech) để đăng quảng cáo cho các sản phẩm hoặc dịch vụ của **nhà quảng cáo**. Nhà xuất bản được trả tiền để hiển thị quảng cáo, giúp tài trợ cho nội dung của họ, và nhiều hoạt động kinh doanh hơn được chuyển đến các trang web của nhà quảng cáo.

Quá trình trên có thể được thực hiện hiệu quả hơn bằng cách sử dụng quảng cáo dựa trên sở thích (IBA). Ý tưởng là khi người dùng truy cập các trang web của nhà xuất bản, họ được phục vụ một lựa chọn quảng cáo **được cá nhân hóa** dựa trên sở thích của họ. Sở thích của họ được suy luận từ các trang web họ đã truy cập trước đây. Trong quá khứ, cookie theo dõi của bên thứ ba đã được sử dụng để thu thập thông tin về sở thích người dùng, nhưng các trình duyệt đang dần loại bỏ khả năng sử dụng cookie của bên thứ ba cho một tỷ lệ người dùng ngày càng tăng. Topics API cung cấp một phần con đường hướng tới mục tiêu này, một cơ chế để triển khai IBA không phụ thuộc vào việc theo dõi người dùng.

Trước tiên, trình duyệt suy luận sở thích của người dùng từ các URL của các trang web họ truy cập có nhúng `<iframe>` ad tech. Những sở thích này được ánh xạ đến các **chủ đề sở thích** cụ thể, và trình duyệt tính toán và ghi lại chủ đề hàng đầu của người dùng (tức là chủ đề mà sở thích của họ được ánh xạ đến thường xuyên nhất) vào cuối mỗi **epoch**. Một epoch là một tuần theo mặc định. Chủ đề hàng đầu được cập nhật mỗi tuần để sở thích luôn được cập nhật và người dùng không bắt đầu thấy quảng cáo cho các chủ đề mà họ không còn quan tâm nữa.

> [!NOTE]
> Quá trình này chỉ xảy ra trên các trang web nơi tính năng Topics API được sử dụng (xem [Các tính năng API nào kích hoạt Topics API?](/en-US/docs/Web/API/Topics_API/Using#what_api_features_enable_the_topics_api)).

Khi trình duyệt đã quan sát một hoặc nhiều chủ đề cho người dùng, Topics API có thể lấy chúng và gửi chúng đến nền tảng ad tech. Nền tảng sau đó có thể sử dụng những chủ đề đó để cá nhân hóa quảng cáo họ phục vụ cho người dùng. API giúp bảo vệ quyền riêng tư bằng cách _chỉ trả về các chủ đề cho người gọi API đã quan sát chúng_ trên các trang được người dùng hiện tại truy cập.

Xem [Sử dụng Topics API](/en-US/docs/Web/API/Topics_API/Using) để giải thích cách hoạt động của API.

### Có những chủ đề nào?

Các chủ đề hàng đầu có thể được trình duyệt tính toán được lưu trữ trong [phân loại sở thích](https://github.com/patcg-individual-drafts/topics/blob/main/taxonomy_v2.md) có sẵn công khai. Phân loại ban đầu đã được đề xuất bởi Chrome, với mục đích trở thành tài nguyên được duy trì bởi những người đóng góp hệ sinh thái được tin tưởng. Phân loại đã được con người chọn lọc để loại trừ các danh mục thường được coi là nhạy cảm, chẳng hạn như dân tộc hoặc xu hướng tình dục.

## Giao diện

Topics API không có giao diện riêng biệt của nó.

### Phần mở rộng của các giao diện khác

- {{domxref("Document.browsingTopics()")}}
  - : Trả về một promise thực hiện với một mảng các đối tượng đại diện cho các chủ đề hàng đầu cho người dùng, một từ mỗi epoch trong ba epoch cuối. Theo mặc định, phương thức cũng khiến trình duyệt ghi lại lần truy cập trang hiện tại như đã được quan sát bởi người gọi, để tên máy chủ của trang có thể được sử dụng sau này trong tính toán chủ đề.
- {{domxref("Window/fetch", "fetch()")}} / {{domxref("Request.Request", "Request()")}}, tùy chọn `browsingTopics`
  - : Giá trị boolean chỉ định rằng các chủ đề được chọn cho người dùng hiện tại nên được gửi trong tiêu đề {{httpheader("Sec-Browsing-Topics")}} cùng với yêu cầu liên quan.
- {{domxref("HTMLIFrameElement.browsingTopics")}}
  - : Thuộc tính boolean chỉ định rằng các chủ đề được chọn cho người dùng hiện tại nên được gửi cùng với yêu cầu nguồn của {{htmlelement("iframe")}} liên kết. Điều này phản ánh giá trị thuộc tính nội dung `browsingtopics`.

## Phần tử HTML

- {{htmlelement("iframe")}}, thuộc tính `browsingtopics`
  - : Thuộc tính boolean, nếu có, chỉ định rằng các chủ đề được chọn cho người dùng hiện tại nên được gửi cùng với yêu cầu nguồn của {{htmlelement("iframe")}}.

## Tiêu đề HTTP

- {{httpheader("Sec-Browsing-Topics")}}
  - : Gửi các chủ đề được chọn cho người dùng hiện tại cùng với yêu cầu, được nền tảng ad tech sử dụng để chọn quảng cáo được cá nhân hóa để hiển thị.
- {{httpheader("Observe-Browsing-Topics")}}
  - : Được dùng để đánh dấu các chủ đề sở thích được suy luận từ URL của trang web gọi (tức là trang web nơi `<iframe>` ad tech được nhúng) như đã quan sát trong phản hồi cho yêu cầu được tạo bởi [tính năng kích hoạt Topics API](/en-US/docs/Web/API/Topics_API/Using#what_api_features_enable_the_topics_api). Sau đó trình duyệt sẽ sử dụng những chủ đề đó để tính toán các chủ đề hàng đầu cho người dùng hiện tại cho các epoch trong tương lai.
- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}}
  - : Kiểm soát quyền truy cập vào Topics API. Khi chính sách cụ thể không cho phép sử dụng Topics API, mọi nỗ lực gọi phương thức `Document.browsingTopics()` hoặc gửi yêu cầu có tiêu đề `Sec-Browsing-Topics` sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.

## Đăng ký

Để sử dụng Topics API trên các trang web của bạn, bạn phải chỉ định nó trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment). Nếu không làm vậy, các tính năng con sau sẽ không hoạt động:

- Promise được trả về bởi phương thức {{domxref("Document.browsingTopics()")}} sẽ từ chối với `NotAllowedError` {{domxref("DOMException")}}.
- Tạo hoặc sửa đổi tiêu đề {{httpheader("Sec-Browsing-Topics")}} sẽ thất bại im lặng, và bất kỳ tiêu đề `Sec-Browsing-Topics` hiện có nào sẽ bị xóa.

## Ví dụ

Xem [Sử dụng Topics API](/en-US/docs/Web/API/Topics_API/Using) để biết các ví dụ mã.

## Thông số kỹ thuật

Tính năng này không phải là một phần của tiêu chuẩn chính thức, mặc dù nó được chỉ định trong [Topics API Unofficial Proposal Draft](https://patcg-individual-drafts.github.io/topics/).

### Vị trí tiêu chuẩn

Hai nhà cung cấp trình duyệt [phản đối](/en-US/docs/Glossary/Web_standards#opposing_standards) đặc tả này. Các vị trí tiêu chuẩn đã biết như sau:

- Mozilla (Firefox): [Tiêu cực](https://mozilla.github.io/standards-positions/#topics)
- Apple (Safari): [Tiêu cực](https://webkit.org/standards-positions/#position-111)

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Topics API](https://privacysandbox.google.com/private-advertising/topics) trên privacysandbox.google.com (2023)
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com (2023)
