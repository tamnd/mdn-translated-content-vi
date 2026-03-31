---
title: Thương lượng nội dung
slug: Web/HTTP/Guides/Content_negotiation
page-type: guide
sidebar: http
---

Trong [HTTP](/en-US/docs/Glossary/HTTP), **_thương lượng nội dung_** là cơ chế được sử dụng để phục vụ các {{Glossary("Representation header","biểu diễn")}} khác nhau của một tài nguyên đến cùng một URI để giúp user-agent chỉ định biểu diễn nào phù hợp nhất cho người dùng (ví dụ, ngôn ngữ tài liệu nào, định dạng hình ảnh nào, hoặc mã hóa nội dung nào).

> [!NOTE]
> Bạn sẽ tìm thấy một số nhược điểm của thương lượng nội dung HTTP trong [một trang wiki từ WHATWG](https://wiki.whatwg.org/wiki/Why_not_conneg). HTML cung cấp các giải pháp thay thế cho thương lượng nội dung thông qua, ví dụ, [phần tử `<source>`](/en-US/docs/Web/HTML/Reference/Elements/source).

## Nguyên tắc của thương lượng nội dung

Một tài liệu cụ thể được gọi là _tài nguyên_. Khi client muốn lấy tài nguyên, client yêu cầu nó thông qua URL. Máy chủ sử dụng URL này để chọn một trong các biến thể có sẵn — mỗi biến thể được gọi là _biểu diễn_ — và trả về một biểu diễn cụ thể cho client. Tài nguyên tổng thể, cũng như mỗi biểu diễn, có URL cụ thể. _Thương lượng nội dung_ xác định cách biểu diễn cụ thể được chọn khi tài nguyên được gọi. Có một số cách để thương lượng giữa client và máy chủ.

![Một client yêu cầu URL. Máy chủ có nhiều tài nguyên được đại diện bởi URL và gửi lại nội dung phù hợp dựa trên yêu cầu.](httpnego.png)

Biểu diễn phù hợp nhất được xác định thông qua một trong hai cơ chế:

- Các [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) cụ thể bởi client (_thương lượng do máy chủ điều khiển_ hoặc _thương lượng chủ động_), đây là cách tiêu chuẩn để thương lượng một loại tài nguyên cụ thể.
- Các [mã phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status) {{HTTPStatus("300")}} (Multiple Choices) hoặc {{HTTPStatus("406")}} (Not Acceptable), {{HTTPStatus("415")}} (Unsupported Media Type) bởi máy chủ (_thương lượng do agent điều khiển_ hoặc _thương lượng phản ứng_), được sử dụng như các cơ chế dự phòng.

Qua nhiều năm, các đề xuất thương lượng nội dung khác, như [thương lượng nội dung trong suốt](https://datatracker.ietf.org/doc/html/rfc2295) và tiêu đề `Alternates`, đã được đề xuất. Chúng không được chấp nhận và đã bị từ bỏ.

## Thương lượng nội dung do máy chủ điều khiển

Trong _thương lượng nội dung do máy chủ điều khiển_, hay thương lượng nội dung chủ động, trình duyệt (hoặc bất kỳ loại user-agent nào) gửi một số tiêu đề HTTP cùng với URL. Các tiêu đề này mô tả lựa chọn ưu tiên của người dùng. Máy chủ sử dụng chúng như gợi ý và thuật toán nội bộ chọn nội dung tốt nhất để phục vụ cho client. Nếu không thể cung cấp tài nguyên phù hợp, nó có thể phản hồi với {{HTTPStatus("406")}} (Not Acceptable) hoặc {{HTTPStatus("415")}} (Unsupported Media Type) và đặt các tiêu đề cho các loại phương tiện mà nó hỗ trợ (ví dụ: sử dụng {{HTTPHeader("Accept-Post")}} hoặc {{HTTPHeader("Accept-Patch")}} cho các yêu cầu POST và PATCH, tương ứng). Thuật toán là đặc thù của máy chủ và không được định nghĩa trong tiêu chuẩn. Xem [thuật toán thương lượng Apache](https://httpd.apache.org/docs/current/en/content-negotiation.html#algorithm).

![Một client yêu cầu URL với các tiêu đề biểu thị sở thích cho các loại nội dung. Máy chủ có nhiều tài nguyên được đại diện bởi URL và gửi lại nội dung cho ngôn ngữ ưa thích và nén nội dung yêu cầu dựa trên các tiêu đề yêu cầu của client.](httpnegoserver.png)

Tiêu chuẩn HTTP/1.1 định nghĩa danh sách các tiêu đề chuẩn bắt đầu thương lượng do máy chủ điều khiển (như {{HTTPHeader("Accept")}}, {{HTTPHeader("Accept-Encoding")}}, và {{HTTPHeader("Accept-Language")}}). Mặc dù {{HTTPHeader("User-Agent")}} không có trong danh sách này, đôi khi nó cũng được sử dụng để gửi một biểu diễn cụ thể của tài nguyên được yêu cầu. Tuy nhiên, điều này không phải lúc nào cũng được coi là thực hành tốt. Máy chủ sử dụng tiêu đề {{HTTPHeader("Vary")}} để chỉ ra các tiêu đề nào nó thực sự sử dụng cho thương lượng nội dung (hay chính xác hơn là các tiêu đề yêu cầu liên quan), để [bộ nhớ đệm](/en-US/docs/Web/HTTP/Guides/Caching) có thể hoạt động tối ưu.

Ngoài ra, có một đề xuất thử nghiệm để thêm nhiều tiêu đề hơn vào danh sách các tiêu đề có sẵn, được gọi là _gợi ý từ client_. Gợi ý từ client quảng cáo loại thiết bị nào user-agent chạy (ví dụ, máy tính để bàn hoặc thiết bị di động).

Mặc dù thương lượng nội dung do máy chủ điều khiển là cách phổ biến nhất để đồng ý về một biểu diễn cụ thể của tài nguyên, nhưng nó có một số nhược điểm:

- Máy chủ không có toàn bộ kiến thức về trình duyệt. Ngay cả với tiện ích mở rộng Client Hints, nó không có kiến thức đầy đủ về khả năng của trình duyệt. Không giống như thương lượng nội dung phản ứng nơi client thực hiện lựa chọn, lựa chọn của máy chủ luôn phần nào tùy ý.
- Thông tin từ client khá dài dòng (nén tiêu đề HTTP/2 giảm thiểu vấn đề này) và là rủi ro quyền riêng tư (HTTP [fingerprinting](/en-US/docs/Glossary/Fingerprinting)).
- Vì nhiều biểu diễn của tài nguyên nhất định được gửi, các bộ nhớ đệm chia sẻ kém hiệu quả hơn và các triển khai máy chủ phức tạp hơn.

### Tiêu đề `Accept`

Tiêu đề {{HTTPHeader("Accept")}} liệt kê các loại MIME của tài nguyên phương tiện mà agent sẵn sàng xử lý. Đây là danh sách các loại MIME được phân tách bằng dấu phẩy, mỗi loại kết hợp với [hệ số chất lượng](/en-US/docs/Glossary/Quality_values), một tham số cho biết mức độ ưu tiên tương đối giữa các loại MIME khác nhau.

Tiêu đề `Accept` được định nghĩa bởi trình duyệt, hoặc bất kỳ user-agent nào khác, và có thể thay đổi theo ngữ cảnh. Ví dụ, tải một trang HTML hoặc hình ảnh, video, hoặc script. Nó khác nhau khi tải tài liệu được nhập trong thanh địa chỉ hoặc phần tử được liên kết thông qua phần tử {{ HTMLElement("img") }}, {{ HTMLElement("video") }}, hoặc {{ HTMLElement("audio") }}. Trình duyệt có thể tự do sử dụng giá trị của tiêu đề mà họ cho là phù hợp nhất; một danh sách đầy đủ [các giá trị mặc định cho trình duyệt phổ biến](/en-US/docs/Web/HTTP/Guides/Content_negotiation/List_of_default_Accept_values) có sẵn.

### Tiêu đề `Accept-CH`

> [!NOTE]
> Đây là một phần của **công nghệ thử nghiệm** được gọi là _Client Hints_. Hỗ trợ ban đầu có trong Chrome 46 trở lên. Giá trị Device-Memory có trong Chrome 61 trở lên.

Tiêu đề thử nghiệm {{HTTPHeader("Accept-CH")}} liệt kê dữ liệu cấu hình mà máy chủ có thể sử dụng để chọn phản hồi phù hợp. Các giá trị hợp lệ ví dụ bao gồm:

| Giá trị                 | Ý nghĩa                                                                                                                                                                                                          |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Sec-CH-Device-Memory`  | Cho biết lượng RAM thiết bị gần đúng. Giá trị này là xấp xỉ được cung cấp bằng cách làm tròn đến lũy thừa gần nhất của 2 và chia số đó cho 1024. Ví dụ, 512 megabytes sẽ được báo cáo là `0.5`. |
| `Sec-CH-Viewport-Width` | Cho biết chiều rộng viewport bố cục tính bằng pixel CSS.                                                                                                                                                         |
| `Sec-CH-Width`          | Cho biết chiều rộng tài nguyên tính bằng pixel vật lý (nói cách khác là kích thước nội tại của hình ảnh).                                                                                                       |

### Tiêu đề `Accept-Encoding`

Tiêu đề {{HTTPHeader("Accept-Encoding")}} định nghĩa mã hóa nội dung chấp nhận được (các nén được hỗ trợ). Giá trị là danh sách q-factor (ví dụ: `br, gzip;q=0.8`) cho biết mức độ ưu tiên của các giá trị mã hóa. Giá trị mặc định `identity` ở mức ưu tiên thấp nhất (trừ khi có ghi chú khác).

Nén các thông điệp HTTP là một trong những cách quan trọng nhất để cải thiện hiệu suất của trang web. Nó thu nhỏ kích thước dữ liệu được truyền và sử dụng tốt hơn băng thông có sẵn. Trình duyệt luôn gửi tiêu đề này và máy chủ nên được cấu hình để sử dụng nén.

### Tiêu đề `Accept-Language`

Tiêu đề {{HTTPHeader("Accept-Language")}} được sử dụng để chỉ ra sở thích ngôn ngữ của người dùng. Đây là danh sách các giá trị với hệ số chất lượng (ví dụ: `de, en;q=0.7`). Giá trị mặc định thường được đặt theo ngôn ngữ của giao diện đồ họa của user-agent, nhưng hầu hết trình duyệt cho phép đặt sở thích ngôn ngữ khác.

Do [tăng entropy dựa trên cấu hình](https://www.eff.org/deeplinks/2010/01/primer-information-theory-and-privacy), một giá trị đã sửa đổi có thể được sử dụng để fingerprint người dùng. Không nên thay đổi giá trị này và trang web không thể tin tưởng vào giá trị này để phản ánh ý định thực sự của người dùng. Tốt nhất là các nhà thiết kế trang web tránh sử dụng phát hiện ngôn ngữ thông qua tiêu đề này vì nó có thể dẫn đến trải nghiệm người dùng kém.

- Họ nên luôn cung cấp cách ghi đè ngôn ngữ do máy chủ chọn, ví dụ bằng cách cung cấp menu ngôn ngữ trên trang web. Hầu hết user-agent cung cấp giá trị mặc định cho tiêu đề `Accept-Language` được điều chỉnh theo ngôn ngữ giao diện người dùng. Người dùng cuối thường không sửa đổi nó vì họ không biết cách hoặc không thể làm như vậy dựa trên môi trường máy tính của họ.
- Một khi người dùng đã ghi đè ngôn ngữ do máy chủ chọn, trang web không nên còn sử dụng phát hiện ngôn ngữ và nên gắn với ngôn ngữ được chọn rõ ràng. Nói cách khác, chỉ các trang vào cho trang web nên sử dụng tiêu đề này để chọn ngôn ngữ phù hợp.

### Tiêu đề `User-Agent`

> [!NOTE]
> Mặc dù có những mục đích sử dụng hợp pháp của tiêu đề này để chọn nội dung, [điều này được coi là thực hành xấu](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent) khi dựa vào nó để xác định các tính năng nào được hỗ trợ bởi user-agent.

Tiêu đề {{HTTPHeader("User-Agent")}} xác định trình duyệt gửi yêu cầu. Chuỗi này có thể chứa danh sách các _mã thông báo sản phẩm_ và _bình luận_ được phân tách bằng dấu cách.

_Mã thông báo sản phẩm_ là tên theo sau bởi `/` và số phiên bản, như `Firefox/4.0.1`. User-agent có thể bao gồm bao nhiêu thứ này như muốn. _Bình luận_ là chuỗi tùy chọn được phân tách bởi dấu ngoặc đơn. Thông tin được cung cấp trong bình luận không được chuẩn hóa, mặc dù nhiều trình duyệt thêm một số mã thông báo vào đó được phân tách bằng `;`.

### Tiêu đề phản hồi `Vary`

Trái ngược với các tiêu đề `Accept-*` trước đây được gửi bởi client, tiêu đề HTTP {{HTTPHeader("Vary")}} được gửi bởi máy chủ web trong phản hồi của nó. Nó chỉ ra danh sách các tiêu đề máy chủ sử dụng trong quá trình thương lượng nội dung do máy chủ điều khiển. Tiêu đề `Vary` cần thiết để thông báo cho bộ nhớ đệm về các tiêu chí quyết định để nó có thể tái tạo nó. Điều này cho phép bộ nhớ đệm hoạt động trong khi đảm bảo rằng nội dung đúng được phục vụ cho người dùng.

Giá trị đặc biệt `*` có nghĩa là thương lượng nội dung do máy chủ điều khiển cũng sử dụng thông tin không được truyền đạt trong tiêu đề để chọn nội dung phù hợp.

Tiêu đề `Vary` được thêm vào trong phiên bản 1.1 của HTTP và cho phép bộ nhớ đệm hoạt động phù hợp. Để làm việc với thương lượng nội dung do máy chủ điều khiển, bộ nhớ đệm cần biết tiêu chí nào mà máy chủ đã sử dụng để chọn nội dung được truyền. Theo cách đó, bộ nhớ đệm có thể phát lại thuật toán và sẽ có thể phục vụ nội dung chấp nhận được trực tiếp, không cần thêm yêu cầu đến máy chủ. Rõ ràng, ký tự đại diện `*` ngăn chặn bộ nhớ đệm xảy ra, vì bộ nhớ đệm không thể biết yếu tố nào đằng sau nó. Để biết thêm thông tin, hãy xem [Bộ nhớ đệm HTTP > Varying responses](/en-US/docs/Web/HTTP/Guides/Caching#vary).

## Thương lượng do agent điều khiển

Thương lượng do máy chủ điều khiển có một vài nhược điểm: nó không mở rộng tốt. Một tiêu đề trên mỗi tính năng được sử dụng trong thương lượng. Nếu bạn muốn sử dụng kích thước màn hình, độ phân giải, hoặc các kích thước khác, bạn cần tạo tiêu đề HTTP mới. Các tiêu đề sau đó phải được gửi với mỗi yêu cầu. Đây không phải là vấn đề nếu chỉ có một vài tiêu đề, nhưng khi số lượng tiêu đề tăng lên, kích thước thông điệp có thể cuối cùng ảnh hưởng đến hiệu suất. Các tiêu đề càng chính xác được gửi, entropy càng nhiều được gửi, cho phép fingerprinting HTTP nhiều hơn và các mối quan ngại quyền riêng tư tương ứng.

HTTP cho phép một loại thương lượng khác: _thương lượng do agent điều khiển_ hoặc _thương lượng phản ứng_. Trong trường hợp này, máy chủ gửi lại trang chứa các liên kết đến các tài nguyên thay thế có sẵn khi đối mặt với yêu cầu mơ hồ. Người dùng được trình bày các tài nguyên và chọn cái muốn sử dụng.

![Một client yêu cầu URL với các tiêu đề biểu thị sở thích cho các loại nội dung. Máy chủ có nhiều tài nguyên được đại diện bởi URL và gửi lại nhiều phản hồi để client có thể chọn nội dung với thuật toán nén ưa thích được áp dụng.](httpnego3.png)

Thật không may, tiêu chuẩn HTTP không chỉ định định dạng của trang để chọn giữa các tài nguyên có sẵn, điều này ngăn chặn việc tự động hóa quy trình. Bên cạnh việc quay trở lại _thương lượng do máy chủ điều khiển_, phương pháp này hầu như luôn được sử dụng với scripting, đặc biệt với chuyển hướng JavaScript: sau khi kiểm tra các tiêu chí thương lượng, script thực hiện chuyển hướng. Một vấn đề thứ hai là cần một yêu cầu thêm để tải tài nguyên thực, làm chậm tính khả dụng của tài nguyên cho người dùng.

## Xem thêm

- [Bộ nhớ đệm](/en-US/docs/Web/HTTP/Guides/Caching)
