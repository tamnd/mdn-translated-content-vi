---
title: Quản lý phiên
slug: Web/Security/Authentication/Session_management
page-type: guide
sidebar: security
---

HTTP thường được gọi là một giao thức _không trạng thái_ (_stateless_), nghĩa là nó không cung cấp cơ chế tích hợp nào để liên kết một chuỗi các yêu cầu HTTP riêng lẻ. Đây là một vấn đề đối với những website muốn duy trì một số trạng thái riêng cho từng client. Ví dụ, một site có thể cho bất kỳ người dùng nào chọn giao diện sáng hoặc tối, và lựa chọn đó sẽ là trạng thái cần được duy trì qua các yêu cầu tiếp theo tới site. Để hỗ trợ điều này, website cần coi một chuỗi yêu cầu từ cùng một client là đại diện cho một _phiên_ (_session_), và phiên đó có thể được gắn với trạng thái bền vững này.

Khi một website có khả năng xác thực người dùng nhằm cấp cho từng cá nhân quyền truy cập vào dữ liệu hoặc thao tác cụ thể, website đó thường muốn coi danh tính của người dùng đã xác thực như một trạng thái được duy trì qua nhiều yêu cầu từ client. Tuy nhiên, không giống như lựa chọn giao diện, danh tính của một người dùng đã xác thực trên site là trạng thái đặc biệt có giá trị với kẻ tấn công, vì vậy tác giả website phải hết sức cẩn thận khi triển khai giải pháp quản lý phiên cho người dùng đã xác thực.

Mô hình quản lý phiên phổ biến nhất là [quản lý phiên tập trung](#centralized_session_management), trong đó trạng thái phiên của người dùng được lưu trên server. Một mô hình thay thế, hữu ích trong một số kiến trúc ứng dụng web nhất định, là [quản lý phiên phi tập trung](#decentralized_session_management) (đôi khi còn được gọi là JWT server tokens). Trong mô hình này, client lưu trạng thái phiên dưới dạng một đối tượng đã được server {{glossary("digital signature", "ký số")}}.

Trong các phần sau, trước tiên chúng ta giải thích mô hình tập trung, sau đó mô tả các cuộc tấn công tiềm tàng và những điểm cần cân nhắc khi triển khai. Tiếp theo, chúng ta sẽ mô tả mô hình phi tập trung, so sánh hai phương pháp, và thảo luận khi nào nên dùng từng cách tiếp cận.

## Quản lý phiên tập trung

Trong quản lý phiên tập trung, trạng thái phiên của người dùng được giữ trên server:

- Khi người dùng được xác thực, server ghi nhận trạng thái của họ và tạo một _session ID_, rồi liên kết ID này với trạng thái đó. Server trả một bản sao của session ID cho client. Client lưu trữ session ID.

- Khi client gửi yêu cầu tới server, client sẽ kèm theo ID đó. Server dùng ID để tra cứu trạng thái phiên của người dùng nhằm quyết định client được phép làm gì.

![Sơ đồ minh họa quản lý phiên bằng trạng thái phiên do server duy trì](session-mgt-centralized.svg)

## Các cuộc tấn công

Khi nhắm vào quản lý phiên, mục tiêu của kẻ tấn công là có thể mạo danh một người dùng hợp lệ mà không cần phải xâm phạm chính hệ thống xác thực của website. Trong phần này, chúng ta sẽ mô tả hai cách chính để kẻ tấn công làm điều đó: [_chiếm quyền phiên_](#session_hijacking) và [_cố định phiên_](#session_fixation).

### Chiếm quyền phiên

Chiếm quyền phiên là thuật ngữ chung cho một cuộc tấn công trong đó kẻ tấn công có thể chiếm lấy phiên của một người dùng hợp lệ. Có một vài cách tiếp cận phổ biến, nhưng tất cả đều liên quan đến việc truy cập giá trị session ID của một người dùng đã xác thực.

#### Chặn session ID

Kẻ tấn công có thể đánh cắp session ID trong lúc nó được gửi giữa client và server, trong một cuộc tấn công [Manipulator in the Middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM).

Biện pháp phòng vệ là phục vụ site qua [TLS](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security).

#### Dự đoán session ID

Nếu kẻ tấn công có thể dự đoán, đoán mò, hoặc brute-force giá trị session ID được gán cho một người dùng hợp lệ, chúng có thể dùng ID đó để mạo danh người dùng mà không cần đánh cắp bản sao do người dùng đang giữ.

Biện pháp phòng vệ là [đảm bảo giá trị session ID đủ dài và đủ ngẫu nhiên để không thể dự đoán](#session_id_values).

#### Tấn công phía client

Kẻ tấn công có thể chiếm quyền một phiên nếu chúng có thể thực thi mã của mình trong trình duyệt của người dùng, trong ngữ cảnh của website mục tiêu, ví dụ trong một cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Nếu session ID khả dụng với JavaScript (ví dụ vì nó được lưu trong [local storage](/en-US/docs/Web/API/Web_Storage_API)), thì kẻ tấn công có thể đánh cắp ID và dùng nó để mạo danh người dùng.

Biện pháp phòng vệ là triển khai các [cơ chế phòng thủ quen thuộc chống XSS](/en-US/docs/Web/Security/Attacks/XSS#defenses_against_xss).

### Cố định phiên

Trong một cuộc tấn công cố định phiên, kẻ tấn công chọn trước một giá trị session ID, rồi thuyết phục website dùng giá trị này làm session ID cho người dùng mục tiêu. Sau đó, kẻ tấn công có thể mạo danh người dùng vì chúng biết ID đó. Trong cuộc tấn công này, kẻ tấn công không cần đánh cắp ID vì chúng đã biết nó ngay từ đầu.

Ví dụ, giả sử website mục tiêu mong đợi session ID được đưa vào như một tham số URL trong các yêu cầu mà client gửi đi. Đồng thời, giả sử lúc đầu người dùng mục tiêu có tài khoản trên website mục tiêu nhưng chưa đăng nhập.

Kẻ tấn công bịa ra một giá trị session ID rồi gửi cho người dùng một email chứa liên kết cùng với một lý do nghe có vẻ hợp lý để người dùng nhấp vào đó. Liên kết trỏ tới website mục tiêu và bao gồm session ID do kẻ tấn công tạo ra như một tham số URL:

```plain
https://target-website.example.org/login?session=ATTACKER-GENERATED-ID
```

Nếu người dùng nhấp vào liên kết, session ID sẽ được gửi tới website. Nếu người dùng sau đó đăng nhập và website tái sử dụng session ID này cho người dùng đã đăng nhập, thì kẻ tấn công có thể mạo danh người dùng vì chúng đã biết giá trị đó.

Nếu website dùng cookie thay vì tham số URL để gửi session ID, thì cuộc tấn công này khó hơn: kẻ tấn công cần có khả năng thực thi một cuộc tấn công XSS trên website mục tiêu. Đây là một trong những lý do khiến cookie là cách tốt hơn nhiều để lưu trữ và truyền session ID so với tham số URL.

Tuy nhiên, biện pháp phòng vệ then chốt chống lại cố định phiên là server luôn phải tạo một session ID mới và vô hiệu hóa mọi giá trị hiện có mỗi khi người dùng đăng nhập.

## Giá trị session ID

Session ID nên:

- Chứa đủ entropy để chống lại [các cuộc tấn công đoán hoặc dự đoán](#predicting_the_session_id). [Hướng dẫn quản lý phiên của OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-id-properties) khuyến nghị ít nhất 64 bit entropy.

- Không mang ý nghĩa gì ngoài vai trò là khóa dành cho server: nghĩa là nó không được chứa bất kỳ thông tin nào về người dùng hoặc tài khoản của họ.

Nếu có thể, website nên dùng một web framework hoặc thư viện uy tín để tạo session ID.

## Lưu trữ session ID

Client cần có khả năng lưu trữ mã định danh phiên một cách an toàn, để kẻ tấn công không thể truy cập giá trị này và chiếm quyền phiên.

Hai lựa chọn chính để lưu mã định danh phiên là [local storage](/en-US/docs/Web/API/Web_Storage_API) và [cookie](/en-US/docs/Web/HTTP/Guides/Cookies).

Cookie là lựa chọn được khuyến nghị, vì website có thể ngăn cookie bị JavaScript truy cập bằng cách đặt thuộc tính [`HttpOnly`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#httponly). Khi thuộc tính này được đặt, ngay cả trong một cuộc tấn công XSS thành công, mã độc cũng không thể truy cập chính session ID (ví dụ để gửi nó cho kẻ tấn công). Điều này đem lại lợi ích rõ ràng so với các phương thức lưu trữ phía client khác.

Tuy nhiên, lưu ý rằng đây không phải là sự bảo vệ hoàn toàn: mã độc vẫn có thể gửi yêu cầu HTTP tới server mục tiêu từ trình duyệt của người dùng mà trong đó session ID sẽ được kèm theo, nên nó vẫn được cấp các quyền của người dùng trên site.

## Truyền session ID

Nếu session ID được lưu trong local storage, client phải tự đọc ID và đưa nó vào các yêu cầu mà nó gửi đi.

Nếu session ID nằm trong cookie, thì cookie sẽ tự động được gửi khi client tạo yêu cầu. Một lần nữa, có các thuộc tính kiểm soát những yêu cầu nào sẽ bao gồm cookie.

### Truyền an toàn

Nếu thuộc tính [`Secure`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#secure) được đặt, cookie sẽ không được gửi qua các kết nối không mã hóa. Đây là một biện pháp phòng vệ chống lại việc cuộc tấn công [Manipulator in the Middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM) đánh cắp mã định danh phiên trong quá trình truyền.

### Kiểm soát đích đến của cookie

Các thuộc tính [`Domain`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#domaindomain-value) và [`Path`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#pathpath-value) kiểm soát những URL nào cookie sẽ được gửi tới, và nên được đặt với giá trị hạn chế nhất có thể, phù hợp với nhu cầu của website.

Theo mặc định, cookie sẽ chỉ được gửi tới đúng host đã đặt nó. Ví dụ, một cookie được đặt từ `https://login.example.org` sẽ không được đưa vào các yêu cầu tới `https://products.example.org` hay thậm chí `https://example.org`. Nếu bạn cần nới lỏng điều này, bạn có thể dùng thuộc tính `Domain`, nhưng bạn không thể cho phép cookie được đưa vào các yêu cầu tới một {{glossary("Site")}} hoàn toàn khác. Ví dụ, nếu cookie được đặt từ `https://example.org`, bạn không thể sắp xếp để nó được gửi tới `https://example.com`.

### Các cân nhắc về CSRF

Nếu một website dùng cookie để truyền mã định danh phiên, nó bắt buộc phải triển khai cơ chế bảo vệ chống [cross-site request forgery (CSRF)](/en-US/docs/Web/Security/Attacks/CSRF). Rủi ro ở đây là trình duyệt có thể kèm cookie trong một yêu cầu từ site của kẻ tấn công tới website mục tiêu, và nếu các cookie đó chứa một session ID hợp lệ, server sẽ coi yêu cầu đó như đến từ một người dùng hợp lệ và thực hiện yêu cầu của kẻ tấn công.

Hướng dẫn về CSRF của chúng tôi mô tả các [biện pháp phòng vệ được khuyến nghị](/en-US/docs/Web/Security/Attacks/CSRF#defenses_against_csrf): lưu ý rằng việc đặt thuộc tính cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) chỉ là một phần của một chiến lược phòng vệ đầy đủ.

## Thời lượng phiên

Việc xác định một phiên nên kéo dài bao lâu trước khi người dùng phải xác thực lại là một sự đánh đổi giữa bảo mật và khả năng sử dụng. Phiên càng kéo dài, kẻ tấn công càng có nhiều thời gian để chiếm quyền nó hoặc sử dụng một session ID bị đánh cắp. Ngược lại, việc phải xác thực lại là một nguồn ma sát đối với người dùng.

Website có thể dùng các thuộc tính cookie [`Expires`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#expiresdate) và [`Max-Age`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#max-agenumber) để kiểm soát thời điểm cookie hết hạn. Nếu một trong hai thuộc tính này được đặt, thì cookie là _cookie bền vững_ (_persistent cookie_), nghĩa là giá trị của nó được lưu lại để tồn tại qua các lần khởi động lại trình duyệt.

Nếu bỏ cả hai thuộc tính này, trình duyệt sẽ quên cookie khi người dùng đóng nó. [OWASP cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#expire-and-max-age-attributes) khuyến nghị website nên bỏ các thuộc tính này. Tuy nhiên, nhiều website vẫn dùng cookie bền vững cho quản lý phiên.

### Thời gian chờ

OWASP cheatsheet mô tả ba loại timeout phiên khác nhau, tất cả đều có thể được triển khai như một phần của chiến lược quản lý phiên:

- _Idle timeout_: hết hạn sau một khoảng thời gian không hoạt động, được định nghĩa là khoảng thời gian client không gửi yêu cầu HTTP nào tới server. Sau khi hết hạn, người dùng phải xác thực lại.
- _Absolute timeout_: hết hạn sau một khoảng thời gian cụ thể, có hoặc không có hoạt động. Sau khi hết hạn, người dùng phải xác thực lại.
- _Renewal timeout_: đây là timeout ngắn hơn absolute timeout, và không phụ thuộc vào việc không hoạt động. Tuy nhiên, khi nó hết hạn, server:
  - Tự động tạo một session ID mới
  - Vô hiệu hóa session ID cũ
  - Gửi session ID mới cho client.

  Điều này cho phép một website giới hạn khoảng thời gian mà session ID còn dùng được đối với kẻ tấn công mà không buộc người dùng phải xác thực lại quá thường xuyên.

Tất cả các timeout này nên được tính toán trên server, và việc hết hạn phiên thực sự cũng phải diễn ra trên server. Vì mục đích khả dụng, client cũng nên xóa trạng thái phiên của nó, nhưng từ góc độ bảo mật thì trạng thái phía server mới là thứ quan trọng.

Khoảng thời gian timeout cụ thể phụ thuộc vào mức độ nhạy cảm của phiên và hồ sơ sử dụng của nó: OWASP cheatsheet có bao gồm các khuyến nghị.

### Các sự kiện vô hiệu hóa

Trong một số tình huống, website có thể muốn vô hiệu hóa các phiên của người dùng và yêu cầu xác thực lại:

1. Khi client cố thực hiện một thao tác có rủi ro cao, chẳng hạn như cố thay đổi hoặc thực sự thay đổi thông tin xác thực của người dùng trên site, hoặc kích hoạt quy trình khôi phục tài khoản (ví dụ đặt lại mật khẩu).

2. Khi server có một số cơ sở để nghĩ rằng session ID có thể đã bị đánh cắp. Ví dụ, điều này có thể bao gồm một lần đăng nhập từ địa chỉ IP hoặc thiết bị mới.

## Quản lý phiên phi tập trung

Trong mô hình "quản lý phiên tập trung" mà chúng ta đã mô tả từ trước đến nay, trạng thái phiên được duy trì trong cơ sở dữ liệu trên server, còn client được cấp một mã định danh cho trạng thái đó và sẽ đưa nó cho server khi gửi yêu cầu.

Một mô hình thay thế có thể được gọi là "quản lý phiên phi tập trung". Trong mô hình này, trạng thái phiên được duy trì dưới dạng một đối tượng do client giữ và đã được {{glossary("digital signature", "ký số")}}. Các đối tượng đã ký này thường được biểu diễn dưới dạng [JSON Web Token (JWT)](https://www.jwt.io/).

Khi server xác thực người dùng, server sẽ:

- Tạo một token đại diện cho trạng thái phiên của người dùng, qua đó quyết định người dùng này nên có kiểu quyền truy cập nào.
- Ký số token này
- Trả token đã ký cho client.

Khi client gửi yêu cầu, nó trình token đã ký cho server; server xác minh chữ ký và dùng trạng thái phiên để quyết định cách xử lý yêu cầu.

Vì trạng thái được duy trì ở phía client, mô hình này phổ biến trong các ứng dụng phân tán nơi client có thể gửi yêu cầu tới nhiều server khác nhau. Client chuyển token của nó cho bất kỳ server nào, và miễn là server đó có thể xác minh các chữ ký do bên phát hành token tạo ra, thì server có thể quyết định cách xử lý yêu cầu: không cần để server đang xử lý yêu cầu phải tương tác trực tiếp với chính bên phát hành token.

Trong sơ đồ dưới đây, chúng ta minh họa client tương tác với hai server:

- _Token server_, nơi xác thực người dùng và phát hành token
- _Resource server_, nơi có thể xác thực token và xử lý yêu cầu cho các client đã được cấp quyền phù hợp. Trong một ứng dụng thực tế, dĩ nhiên có thể có nhiều resource server, mỗi server xử lý một khía cạnh khác nhau của ứng dụng.

![Sơ đồ minh họa quản lý phiên bằng trạng thái phiên do client duy trì](session-mgt-decentralized.svg)

Lưu ý rằng quản lý phiên phi tập trung thường phức tạp hơn mô hình tập trung và đưa vào một số lỗ hổng mà chúng ta sẽ thảo luận trong các phần tiếp theo. Nếu kiến trúc ứng dụng của bạn không đòi hỏi điều này, nhìn chung nên dùng mô hình tập trung.

### Lưu trữ token

Các cân nhắc về lưu trữ token phần lớn giống với [lưu trữ session ID](#session_id_storage): nếu kẻ tấn công có thể đánh cắp token, chúng có thể chiếm quyền phiên của người dùng. Vì vậy, website thường chọn lưu token trong cookie `HttpOnly` để hưởng lợi từ lớp bảo vệ mà cách này mang lại trước XSS phía client.

Có thêm một vài điểm cần cân nhắc mà mô hình phi tập trung dựa trên token có thể phải tính đến:

- Token lớn hơn session ID rất nhiều, trong khi cookie có kích thước tối đa là 4KB.

- Nếu một ứng dụng phân tán cần dùng các dịch vụ từ các {{glossary("Registrable domain", "registrable domain")}} khác nhau, thì nó không thể dùng cookie để lưu token, vì trình duyệt sẽ không gửi một cookie tới một site khác với site đã đặt cookie đó. Ví dụ, nếu `https://example.com` đặt một cookie, nó sẽ không được gửi tới `https://example.org`.

### Xác minh token

Nhiều cuộc tấn công vào quản lý phiên phi tập trung tập trung vào việc xác minh token: tức là quá trình trong đó resource server xác minh một token và các tuyên bố (_claim_) mà nó chứa trước khi quyết định xử lý yêu cầu như thế nào.

Ví dụ, mục đích của việc ký token là để ngăn kẻ tấn công thay đổi một token hiện có hoặc tạo token của riêng chúng để cấp cho mình các quyền của mục tiêu. Tuy nhiên, định dạng JWT cho phép các token không chứa chữ ký, và [một số thư viện xác minh JWT trước đây từng chấp nhận các token như vậy](https://auth0.com/blog/critical-vulnerabilities-in-json-web-token-libraries/). Điều này có nghĩa là kẻ tấn công có thể:

1. Tạo một token giả, cấp cho chúng quyền truy cập vào tài khoản của mục tiêu
2. Chỉ ra rằng token này không chứa chữ ký
3. Trình token đó cho một resource server

Nếu thư viện JWT của resource server không bắt buộc phải có chữ ký, nó có thể chấp nhận token này và cấp quyền truy cập cho kẻ tấn công.

Để phòng vệ trước kiểu tấn công như vậy, resource server cần bảo đảm thư viện JWT mà nó dùng luôn kiểm tra chữ ký của token.

### Vô hiệu hóa phiên

Trong phần thảo luận về [các sự kiện vô hiệu hóa](#invalidation_events), chúng ta đã thấy rằng trong một số tình huống website muốn vô hiệu hóa phiên của người dùng và buộc họ xác thực lại, do có một sự kiện nào đó có thể là bằng chứng cho thấy session ID đã bị kẻ tấn công đánh cắp. Ví dụ, nếu người dùng cố thay đổi mật khẩu, site nên vô hiệu hóa tất cả các phiên hiện tại của họ.

Với mô hình tập trung, nơi trạng thái phiên của người dùng được duy trì trên server, server có thể vô hiệu hóa một phiên bằng cách xóa trạng thái phiên mà nó đang lưu.

Tuy nhiên, với mô hình phi tập trung, client giữ token phiên và token này là tự chứa: resource server lẽ ra phải có thể quyết định cách xử lý yêu cầu chỉ dựa trên nội dung của token. Điều này khiến việc thu hồi token sau khi nó đã được phát hành trở nên khó khăn.

Giải pháp phổ biến nhất là:

1. Cấp cho các token mà client dùng để truy cập resource server (đôi khi được gọi là _access token_) một thời hạn hiệu lực ngắn, để ngay cả khi chúng bị đánh cắp, chúng cũng không thể bị dùng quá lâu.

2. Thêm một loại token mới gọi là _refresh token_, được cấp cho client khi người dùng xác thực. Token này có tuổi thọ dài hơn nhiều so với access token.

3. Cho phép token server phát hành access token mới khi được trình một refresh token hợp lệ.

![Sơ đồ minh họa quản lý phiên bằng trạng thái phiên do client duy trì, cùng với refresh token](session-mgt-decentralized-refresh-token.svg)

Endpoint refresh cung cấp cho ứng dụng một nơi tập trung để quyết định xem phiên của người dùng có nên bị vô hiệu hóa hay không. Nếu nó chọn vô hiệu hóa phiên, nó làm như vậy bằng cách từ chối phát hành access token mới.

## Framework và thư viện

Thay vì tự triển khai mọi chi tiết của quản lý phiên, chúng tôi khuyến nghị bạn dùng một framework hoặc thư viện có uy tín, và dùng các khả năng mà nó cung cấp cho quản lý phiên.

## Danh sách kiểm tra quản lý phiên

Chúng ta có thể tóm tắt các khuyến nghị ở trên như sau:

- Chọn mô hình quản lý phiên tập trung nếu kiến trúc ứng dụng của bạn cho phép.
- Ưu tiên lưu session ID trong cookie. Nếu bạn làm vậy:
  - Đặt các thuộc tính `Secure` và `HttpOnly`.
  - Triển khai các biện pháp phòng vệ CSRF, bao gồm đặt thuộc tính `SameSite` thành `Lax` hoặc tốt hơn là `Strict`, đồng thời dùng thêm các kỹ thuật khác như fetch metadata hoặc CSRF token.
- Xác định chính sách hết hạn phiên, có thể bao gồm idle timeout, absolute timeout, và renewal timeout.
- Vô hiệu hóa phiên của người dùng khi có các sự kiện có thể cho thấy phiên đã bị chiếm quyền.
- Nếu bạn triển khai hệ thống quản lý phiên phi tập trung bằng token:
  - Bảo đảm các endpoint của bạn xác minh token đúng cách.
  - Cân nhắc thêm refresh token và cấp cho access token tuổi thọ ngắn.
- Dùng một framework hoặc thư viện quản lý phiên uy tín thay vì tự triển khai quản lý phiên.

## Xem thêm

- [Session Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html) (OWASP)
