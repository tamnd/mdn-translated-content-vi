---
title: Quản lý phiên
slug: Web/Security/Authentication/Session_management
page-type: guide
sidebar: security
---

HTTP thường được gọi là một giao thức _không trạng thái_ (stateless), nghĩa là nó không cung cấp cơ chế tích hợp sẵn để liên kết một chuỗi các yêu cầu HTTP riêng lẻ. Điều này là vấn đề đối với các website muốn duy trì một số trạng thái riêng cho client. Ví dụ, một site có thể cho bất kỳ người dùng nào chọn giao diện sáng hoặc tối, và khi đó lựa chọn của họ sẽ là trạng thái cần được duy trì qua các yêu cầu tiếp theo tới site. Để hỗ trợ điều này, website cần xem một chuỗi yêu cầu từ một client đơn lẻ như đại diện cho một _phiên_ (session), có thể được gắn với trạng thái bền vững này.

Khi một website có khả năng xác thực người dùng để cấp cho từng cá nhân quyền truy cập vào dữ liệu hoặc hành động cụ thể, nó thường muốn xem danh tính của người dùng đã xác thực như một trạng thái tồn tại qua nhiều yêu cầu từ client. Tuy nhiên, khác với lựa chọn giao diện, danh tính của người dùng đã xác thực trên site là một trạng thái đặc biệt có giá trị đối với kẻ tấn công, vì vậy tác giả site phải rất cẩn thận khi triển khai giải pháp quản lý phiên cho người dùng đã xác thực.

Mô hình phổ biến nhất cho quản lý phiên là [quản lý phiên tập trung](#centralized_session_management), trong đó trạng thái phiên của người dùng được lưu trên server.
Một mô hình thay thế, hữu ích trong một số kiến trúc ứng dụng web, là [quản lý phiên phi tập trung](#decentralized_session_management) (đôi khi còn được gọi là JWT Server tokens). Trong mô hình này, client lưu trạng thái phiên dưới dạng một đối tượng đã được {{glossary("digital signature", "ký số")}} bởi server.

Trong các phần tiếp theo, trước hết chúng ta giải thích mô hình tập trung, sau đó mô tả các cuộc tấn công tiềm ẩn và các cân nhắc triển khai.
Rồi chúng ta sẽ mô tả mô hình phi tập trung, so sánh hai phương pháp, và thảo luận khi nào nên dùng từng cách tiếp cận.

## Quản lý phiên tập trung

Trong quản lý phiên tập trung, trạng thái phiên của người dùng được giữ trên server:

- Khi người dùng được xác thực, server ghi lại trạng thái của họ và tạo một _session ID_, mà nó liên kết với trạng thái này. Server trả về một bản sao của session ID cho client. Client lưu session ID.

- Khi client gửi yêu cầu tới server, client bao gồm ID đó. Server dùng nó để tra cứu trạng thái phiên của người dùng, nhằm quyết định client được phép làm gì.

![Sơ đồ cho thấy quản lý phiên dùng trạng thái phiên do server duy trì](session-mgt-centralized.svg)

## Các cuộc tấn công

Khi nhắm vào quản lý phiên, mục tiêu của kẻ tấn công là có thể mạo danh một người dùng hợp lệ mà không cần phải xâm phạm chính hệ thống xác thực của website. Trong phần này, chúng ta sẽ mô tả hai cách chính mà kẻ tấn công có thể làm điều đó: [_chiếm quyền phiên_](#session_hijacking) và [_cố định phiên_](#session_fixation).

### Chiếm quyền phiên

Chiếm quyền phiên là thuật ngữ chung cho một cuộc tấn công trong đó kẻ tấn công có thể chiếm lấy phiên của người dùng hợp lệ. Có vài cách tiếp cận phổ biến ở đây, nhưng tất cả đều liên quan đến việc truy cập giá trị session ID của một người dùng đã xác thực.

#### Chặn session ID

Kẻ tấn công có thể đánh cắp session ID trong lúc nó đang được truyền giữa client và server, trong một cuộc tấn công [manipulator in the middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM).

Biện pháp phòng vệ ở đây là phục vụ site qua [TLS](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security).

#### Dự đoán session ID

Nếu kẻ tấn công có thể dự đoán, đoán, hoặc brute-force giá trị session ID được gán cho người dùng hợp lệ, thì chúng có thể dùng ID đó để mạo danh họ mà không cần đánh cắp bản sao session ID của nạn nhân.

Biện pháp phòng vệ ở đây là [đảm bảo các giá trị session ID đủ dài và đủ ngẫu nhiên để không thể đoán được](#session_id_values).

#### Tấn công client

Kẻ tấn công có thể chiếm quyền phiên nếu nó có thể thực thi mã của mình trong trình duyệt của người dùng, trong ngữ cảnh của website mục tiêu, ví dụ trong một cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Nếu session ID có sẵn cho JavaScript (ví dụ, vì nó được lưu trong [local storage](/en-US/docs/Web/API/Web_Storage_API)), thì kẻ tấn công có thể đánh cắp ID và dùng nó để mạo danh người dùng.

Biện pháp phòng vệ ở đây là triển khai các [biện pháp phòng vệ thông thường chống XSS](/en-US/docs/Web/Security/Attacks/XSS#defenses_against_xss).

### Cố định phiên

Trong một cuộc tấn công cố định phiên, kẻ tấn công chọn một giá trị session ID, rồi lừa website dùng giá trị này làm session ID cho người dùng mục tiêu. Sau đó kẻ tấn công có thể mạo danh người dùng, vì chúng biết ID. Trong cuộc tấn công này, kẻ tấn công không cần đánh cắp ID, vì chúng đã biết nó từ đầu.

Ví dụ, giả sử website mục tiêu mong đợi session ID được bao gồm dưới dạng tham số URL trong các yêu cầu mà client gửi. Giả sử cũng rằng ban đầu, người dùng mục tiêu có một tài khoản trên website mục tiêu nhưng chưa đăng nhập.

Kẻ tấn công tạo ra một giá trị session ID và gửi cho người dùng một email chứa một liên kết, với một lý do có vẻ hợp lý để người dùng nhấp vào liên kết đó. Liên kết dẫn tới website mục tiêu, và bao gồm session ID do kẻ tấn công tạo ra như một tham số URL:

```plain
https://target-website.example.org/login?session=ATTACKER-GENERATED-ID
```

Nếu người dùng nhấp vào liên kết, session ID sẽ được gửi tới website. Nếu sau đó người dùng đăng nhập, và website tái sử dụng session ID này cho người dùng đã đăng nhập, thì kẻ tấn công có thể mạo danh người dùng, vì chúng đã biết giá trị đó.

Nếu website dùng cookie thay vì tham số URL để gửi session ID, thì cuộc tấn công này khó hơn: kẻ tấn công cần có khả năng thực thi một cuộc tấn công XSS trên website mục tiêu. Đây là một lý do khiến cookie là phương pháp tốt hơn nhiều so với tham số URL để lưu trữ và truyền đạt session ID.

Tuy nhiên, biện pháp phòng vệ then chốt chống cố định phiên là server phải luôn tạo một session ID mới, và vô hiệu hóa mọi giá trị đã có, mỗi khi người dùng đăng nhập.

## Giá trị session ID

Session ID nên:

- Chứa đủ entropy để chống lại [tấn công đoán hoặc dự đoán](#predicting_the_session_id). [OWASP guide to session management](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-id-properties) khuyến nghị ít nhất 64 bit entropy.

- Không có ý nghĩa gì ngoài việc là một khóa cho server: tức là nó không nên chứa bất kỳ thông tin nào về người dùng hoặc tài khoản của họ.

Nếu có thể, website nên dùng một web framework hoặc thư viện uy tín để tạo session ID.

## Lưu trữ session ID

Client cần có khả năng lưu trữ định danh phiên một cách an toàn, ताकि kẻ tấn công không thể truy cập giá trị và chiếm quyền phiên.

Hai lựa chọn chính để lưu định danh phiên là [local storage](/en-US/docs/Web/API/Web_Storage_API) và [cookie](/en-US/docs/Web/HTTP/Guides/Cookies).

Cookie là lựa chọn được khuyến nghị, vì website có thể ngăn cookie không bị JavaScript truy cập bằng cách đặt thuộc tính [`HttpOnly`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#httponly). Với thuộc tính này, ngay cả khi một cuộc tấn công XSS thành công, mã độc hại cũng không thể truy cập chính session ID (ví dụ, để gửi nó cho kẻ tấn công). Điều này mang lại lợi thế rõ ràng so với các phương thức lưu trữ phía client khác.

Lưu ý rằng đây không phải là một biện pháp bảo vệ hoàn toàn: mã độc hại vẫn có thể thực hiện các yêu cầu HTTP tới server mục tiêu từ trình duyệt của người dùng, và các yêu cầu đó sẽ bao gồm session ID, nên sẽ được cấp quyền như người dùng trên site.

## Truyền session ID

Nếu session ID được lưu trong local storage, thì client phải tự đọc ID và đưa nó vào các yêu cầu mà nó gửi.

Nếu session ID nằm trong cookie, thì nó sẽ tự động được gửi khi client gửi yêu cầu. Một lần nữa, có các thuộc tính kiểm soát những yêu cầu nào sẽ bao gồm cookie.

### Truyền an toàn

Nếu thuộc tính [`Secure`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#secure) được đặt, cookie sẽ không được gửi qua các kết nối không mã hóa. Đây là một biện pháp phòng chống việc [manipulator in the middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM) đánh cắp định danh phiên trong lúc nó đang truyền.

### Kiểm soát đích cookie

Các thuộc tính [`Domain`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#domaindomain-value) và [`Path`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#pathpath-value) kiểm soát các URL mà cookie sẽ được gửi tới, và nên được đặt ở các giá trị hạn chế nhất có thể, dựa trên nhu cầu của site.

Theo mặc định, cookie chỉ được gửi tới cùng host đã đặt nó. Ví dụ, một cookie được đặt từ `https://login.example.org` sẽ không được bao gồm trong các yêu cầu tới `https://products.example.org` hoặc thậm chí `https://example.org`. Nếu bạn cần nới lỏng điều này, bạn có thể dùng thuộc tính `Domain`, nhưng bạn không thể cho phép cookie được bao gồm trong các yêu cầu tới một {{glossary("Site")}} hoàn toàn khác. Ví dụ, nếu cookie được đặt từ `https://example.org`, bạn không thể sắp xếp để nó được gửi tới `https://example.com`.

### Cân nhắc CSRF

Nếu một website dùng cookie để truyền định danh phiên, nó phải triển khai bảo vệ chống lại các cuộc tấn công [cross-site request forgery (CSRF)](/en-US/docs/Web/Security/Attacks/CSRF). Rủi ro ở đây là trình duyệt có thể bao gồm cookie trong một yêu cầu từ site của kẻ tấn công tới website mục tiêu, và nếu các cookie này bao gồm một session ID hợp lệ, thì server sẽ coi yêu cầu như đến từ một người dùng hợp lệ và thực hiện yêu cầu của kẻ tấn công.

Hướng dẫn CSRF của chúng ta mô tả [các biện pháp phòng vệ được khuyến nghị](/en-US/docs/Web/Security/Attacks/CSRF#defenses_against_csrf) ở đây: lưu ý rằng đặt thuộc tính cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) chỉ là một phần của biện pháp phòng vệ đầy đủ.

## Thời lượng phiên

Việc xác định một phiên nên kéo dài bao lâu trước khi người dùng phải xác thực lại là sự đánh đổi giữa bảo mật và khả năng sử dụng. Phiên càng dài, kẻ tấn công càng có nhiều thời gian để chiếm nó hoặc dùng session ID bị đánh cắp. Ngược lại, việc phải xác thực lại là nguồn gây ma sát cho người dùng.

Website có thể dùng các thuộc tính cookie [`Expires`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#expiresdate) và [`Max-Age`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#max-agenumber) để kiểm soát thời điểm cookie hết hạn. Nếu một trong hai thuộc tính này được đặt, cookie là cookie _persistent_, nghĩa là giá trị của nó được ghi lại để có thể tồn tại qua các lần khởi động lại trình duyệt.

Nếu cả hai thuộc tính đều bị bỏ qua, trình duyệt sẽ quên cookie khi người dùng đóng nó. [OWASP cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#expire-and-max-age-attributes) khuyến nghị website nên bỏ qua các thuộc tính này. Tuy nhiên, nhiều website vẫn dùng cookie persistent cho quản lý phiên.

### Timeout

OWASP cheatsheet mô tả ba kiểu timeout phiên khác nhau, cả ba đều có thể được triển khai như một phần của chiến lược quản lý phiên:

- _Idle timeout_: timeout sau một khoảng không hoạt động, được định nghĩa là khoảng thời gian client không gửi yêu cầu HTTP nào tới server. Sau khi timeout, người dùng phải xác thực lại.
- _Absolute timeout_: timeout sau một khoảng thời gian cụ thể, bất kể có hoạt động hay không. Sau khi timeout, người dùng phải xác thực lại.
- _Renewal timeout_: timeout ngắn hơn absolute timeout, và không phụ thuộc vào việc không hoạt động. Tuy nhiên, khi nó timeout, server:
  - Tự động tạo một session ID mới
  - Vô hiệu hóa session ID cũ
  - Gửi session ID mới cho client.

  Điều này cho phép website giới hạn khoảng thời gian mà một session ID có thể bị kẻ tấn công sử dụng, mà không buộc người dùng phải xác thực lại quá thường xuyên.

Tất cả các timeout này nên được tính trên server, và việc thực sự hết hạn phiên phải diễn ra trên server. Vì mục đích khả dụng, client cũng nên xóa trạng thái phiên của nó, nhưng từ góc độ bảo mật thì trạng thái trên server mới là điều quan trọng.

Các khoảng timeout cụ thể phụ thuộc vào mức độ nhạy cảm của phiên và mô hình sử dụng của nó: OWASP cheatsheet có các khuyến nghị.

### Sự kiện vô hiệu hóa

Trong một số tình huống, website có thể muốn vô hiệu hóa các phiên của người dùng và yêu cầu xác thực lại:

1. Khi client cố thực hiện một thao tác có rủi ro cao, chẳng hạn cố thay đổi, hoặc thực sự thay đổi, thông tin xác thực của người dùng trên site, hoặc kích hoạt quy trình khôi phục tài khoản (ví dụ, đặt lại mật khẩu).

2. Khi server có cơ sở để nghĩ rằng session ID có thể đã bị đánh cắp. Điều này có thể bao gồm, ví dụ, một lần đăng nhập từ địa chỉ IP hoặc thiết bị mới.

## Quản lý phiên phi tập trung

Trong mô hình "quản lý phiên tập trung" mà chúng ta đã mô tả cho đến nay, trạng thái phiên được duy trì trong cơ sở dữ liệu trên server, và client được cấp một định danh cho trạng thái đó, rồi nó gửi định danh này cho server khi thực hiện yêu cầu.

Một mô hình thay thế có thể được gọi là "quản lý phiên phi tập trung". Trong mô hình này, trạng thái phiên được duy trì dưới dạng một đối tượng {{glossary("digital signature", "được ký số")}} trên client. Những đối tượng đã ký này thường được biểu diễn dưới dạng [JSON Web Token (JWT)](https://www.jwt.io/).

Khi server xác thực người dùng, server:

- Tạo một token biểu diễn trạng thái phiên của người dùng, token này xác định mức độ truy cập mà người dùng nên có.
- Ký số token này
- Trả token đã ký cho client.

Khi client gửi yêu cầu, nó trình token đã ký cho server, server xác minh chữ ký và dùng trạng thái phiên để quyết định cách xử lý yêu cầu.

Vì trạng thái được duy trì trên client, mô hình này phổ biến cho các ứng dụng phân tán trong đó client có thể gửi yêu cầu tới nhiều server khác nhau. Client chuyển token của nó tới bất kỳ server nào, và miễn là server đó có thể xác minh các chữ ký do bên phát hành token tạo ra, thì server đó có thể quyết định cách xử lý yêu cầu: không cần server đang xử lý yêu cầu phải tương tác trực tiếp với bên phát hành token.

Trong sơ đồ dưới đây, chúng ta thấy client tương tác với hai server:

- _Token server_, xác thực người dùng và phát hành token
- _Resource server_, có thể xác minh token và thực hiện yêu cầu cho các client được ủy quyền đúng cách. Trong một ứng dụng thực tế, dĩ nhiên có thể có nhiều hơn một resource server, mỗi server xử lý một khía cạnh khác nhau của ứng dụng.

![Sơ đồ cho thấy quản lý phiên dùng trạng thái phiên do client duy trì](session-mgt-decentralized.svg)

Lưu ý rằng quản lý phiên phi tập trung có xu hướng phức tạp hơn mô hình tập trung, và đưa vào một số lỗ hổng mà chúng ta sẽ bàn ở các phần tiếp theo. Nếu kiến trúc ứng dụng của bạn không cần nó, thì nhìn chung tốt hơn là dùng mô hình tập trung.

### Lưu trữ token

Các cân nhắc cho lưu trữ token phần lớn giống như cho [lưu trữ session ID](#session_id_storage): nếu kẻ tấn công có thể đánh cắp token, chúng có thể chiếm quyền phiên của người dùng. Vì vậy website thường chọn lưu token trong cookie `HttpOnly`, để hưởng lợi từ sự bảo vệ mà nó mang lại trước XSS phía client.

Có một vài cân nhắc bổ sung mà mô hình dựa trên token, phi tập trung có thể cần tính đến:

- Token lớn hơn rất nhiều so với session ID, và cookie có kích thước tối đa 4KB.

- Nếu một ứng dụng phân tán cần dùng dịch vụ từ các {{glossary("Registrable domain", "registrable domain")}} khác nhau, thì nó không thể dùng cookie để lưu token, vì trình duyệt sẽ không gửi cookie tới một site khác với site đã đặt cookie. Ví dụ, nếu `https://example.com` đặt cookie, nó sẽ không được gửi tới `https://example.org`.

### Xác minh token

Nhiều cuộc tấn công vào quản lý phiên phi tập trung tập trung vào xác minh token: tức là quá trình resource server xác minh một token và các claims mà nó chứa trước khi quyết định xử lý yêu cầu như thế nào.

Ví dụ, mục đích của việc ký token là ngăn kẻ tấn công sửa đổi token hiện có hoặc tự tạo token cho phép chúng có đặc quyền của mục tiêu. Tuy nhiên, định dạng JWT cho phép token không chứa chữ ký, và [một số thư viện xác minh JWT trong quá khứ đã chấp nhận các token như vậy](https://auth0.com/blog/critical-vulnerabilities-in-json-web-token-libraries/). Điều đó có nghĩa là kẻ tấn công có thể:

1. Tạo một token giả, cho chúng quyền truy cập vào tài khoản của mục tiêu
2. Chỉ ra rằng token này không chứa chữ ký
3. Trình token đó cho một resource server

Nếu thư viện JWT của resource server không ép buộc sự hiện diện của chữ ký, nó có thể chấp nhận token này và cấp quyền truy cập cho kẻ tấn công.

Để phòng chống một cuộc tấn công như vậy, resource server cần bảo đảm rằng thư viện JWT nó dùng luôn kiểm tra chữ ký token.

### Vô hiệu hóa phiên

Trong phần thảo luận về [sự kiện vô hiệu hóa](#invalidation_events), chúng ta đã thấy rằng trong một số tình huống website muốn vô hiệu hóa phiên của người dùng và buộc họ xác thực lại, do một sự kiện nào đó có thể là bằng chứng cho thấy session ID đã bị kẻ tấn công đánh cắp. Ví dụ, nếu người dùng cố đổi mật khẩu, site nên vô hiệu hóa tất cả phiên hiện tại của họ.

Với mô hình tập trung, nơi trạng thái phiên của người dùng được duy trì trên server, server có thể vô hiệu hóa một phiên bằng cách xóa trạng thái phiên mà nó lưu.

Tuy nhiên, với mô hình phi tập trung, client giữ token phiên, và token là đối tượng tự chứa: resource server phải có thể quyết định cách xử lý yêu cầu chỉ dựa trên nội dung của token. Điều này khiến việc thu hồi token sau khi đã phát hành trở nên khó khăn.

Giải pháp phổ biến nhất cho việc này là:

1. Cho các token mà client dùng để truy cập resource server (đôi khi được gọi là _access token_) một thời hạn sử dụng ngắn, ताकि ngay cả khi bị đánh cắp, chúng cũng không thể dùng quá lâu.

2. Thêm một loại token mới gọi là _refresh token_, được cấp cho client khi người dùng xác thực. Token này có tuổi thọ dài hơn nhiều so với access token.

3. Cho phép token server phát hành access token mới khi được trình một refresh token hợp lệ.

![Sơ đồ cho thấy quản lý phiên dùng trạng thái phiên do client duy trì, với refresh token](session-mgt-decentralized-refresh-token.svg)

Refresh endpoint cung cấp cho ứng dụng một nơi tập trung để quyết định xem phiên của người dùng có nên bị vô hiệu hóa hay không. Nếu nó thực sự quyết định vô hiệu hóa phiên, nó làm điều đó bằng cách từ chối phát hành access token mới.

## Framework và thư viện

Thay vì tự triển khai mọi chi tiết của quản lý phiên, chúng tôi khuyến nghị bạn dùng một framework hoặc thư viện uy tín, và dùng các cơ chế nó cung cấp cho quản lý phiên.

## Checklist quản lý phiên

Chúng ta có thể tóm tắt các khuyến nghị ở trên như sau:

- Chọn mô hình tập trung cho quản lý phiên, nếu kiến trúc ứng dụng của bạn cho phép.
- Ưu tiên lưu session ID trong cookie. Nếu bạn làm vậy:
  - Đặt các thuộc tính `Secure` và `HttpOnly`.
  - Triển khai các biện pháp phòng vệ CSRF, bao gồm đặt thuộc tính `SameSite` thành `Lax` hoặc tốt hơn là `Strict`, nhưng cũng dùng các kỹ thuật khác như fetch metadata hoặc CSRF token.
- Định nghĩa một chính sách hết hạn phiên, có thể bao gồm idle timeout, absolute timeout, và renewal timeout.
- Vô hiệu hóa phiên của người dùng khi có các sự kiện có thể cho thấy chiếm quyền phiên.
- Nếu bạn triển khai hệ thống quản lý phiên phi tập trung bằng token:
  - Bảo đảm các endpoint của bạn xác thực token đúng cách.
  - Cân nhắc thêm refresh token và cho access token thời hạn ngắn.
- Dùng một framework hoặc thư viện quản lý phiên uy tín, thay vì tự triển khai quản lý phiên.

## Xem thêm

- [Session Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html) (OWASP)
