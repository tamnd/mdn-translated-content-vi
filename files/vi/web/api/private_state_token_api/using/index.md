---
title: Sử dụng Private State Token API
slug: Web/API/Private_State_Token_API/Using
page-type: web-api-overview
---

{{DefaultAPISidebar("Private State Token API")}}

Trang này giải thích cách sử dụng Private State Tokens API để truyền đạt tin cậy về tính xác thực của người dùng từ ngữ cảnh duyệt web này sang ngữ cảnh khác.

## Tổng quan cấp cao

Quá trình sử dụng private state token có thể chia thành ba giai đoạn:

1. Phát hành token
2. Đổi token
3. Sử dụng redemption record

Phần này tóm tắt các giai đoạn đó. Chúng ta sẽ xem xét chúng chi tiết hơn trong các phần tiếp theo.

Private state token sử dụng [Privacy Pass protocol](https://privacypass.github.io/) trong nền để xử lý việc phát hành và vận chuyển token.

### Phát hành token

1. Giả sử người dùng truy cập trang web `issuer.example`.
2. `issuer.example` có thể thực hiện các bước để _thiết lập_ tin cậy về người dùng. Điều này có thể được thực hiện bằng các phương pháp như [CAPTCHA](https://en.wikipedia.org/wiki/CAPTCHA), xác minh địa chỉ email, ghi lại lịch sử mua hàng hợp lệ của người dùng, hoặc kết hợp nhiều phương pháp.
   > [!NOTE]
   > Private state token không phải là sự thay thế cho CAPTCHA hay các cơ chế thiết lập tin cậy khác. Private state token cung cấp cách _truyền đạt_ tin cậy về người dùng, không phải _thiết lập_ tin cậy.
3. Sau khi tin cậy được thiết lập, `issuer.example` có thể gửi yêu cầu đến server để phát hành **private state token**, một token mật mã đại diện cho tin cậy về người dùng đã được xác minh. Trong bối cảnh này, `issuer.example` được gọi là **issuer**. Server được gọi là **issuer server**.
4. Nếu yêu cầu thành công, token được lưu trữ an toàn trong trình duyệt của người dùng.

### Đổi token

Nếu một trang web khác muốn thiết lập tin cậy về cùng người dùng đó, họ có thể làm vậy bằng cách đổi một private state token đã được phát hành cho trình duyệt của người dùng bởi trang web khác, thay vì phải thực hiện lại toàn bộ quá trình thiết lập tin cậy từ đầu.

1. Giả sử người dùng truy cập một trang web khác, `redeemer.example`.
2. `redeemer.example` có thể gửi yêu cầu đến server để đổi token cho người dùng và thiết bị cụ thể đó.
3. Trình duyệt kiểm tra xem nó có lưu token cho người dùng và thiết bị đó không. Nếu có và token còn có thể sử dụng (chưa được đổi và chưa hết hạn), nó sẽ gửi token đến server để đổi. Trong bối cảnh này, `redeemer.example` được gọi là **redeemer**. Server được gọi là **redeemer server**.
4. Nếu token được đổi thành công, redeemer server gửi **redemption record** cho trình duyệt để xác minh tin cậy người dùng.

### Sử dụng redemption record

Sau khi trình duyệt nhận được redemption record, nó có thể được sử dụng như tín hiệu tin cậy cho người dùng hiện tại trong nhiều ngữ cảnh khác nhau, ví dụ khi cho phép họ thực hiện các hành động nhạy cảm như đăng nhập, mua sản phẩm hoặc đăng bình luận. Tín hiệu tin cậy này cũng có thể được chuyển tiếp cho các bên khác để truyền đạt tin cậy.

## Ví dụ triển khai

Bạn có thể tìm ví dụ triển khai private state token tại [Private State Token Demo Issuer](https://privatetokens.dev/) (xem [mã nguồn](https://github.com/GoogleChromeLabs/private-state-token-demo/)).

## Phát hành token

Phần này hướng dẫn quy trình thiết lập issuer server và phát hành token qua trang web issuer.

### Đăng ký để trở thành issuer

Nếu bạn muốn trở thành issuer và cho trang web của mình phát hành private state token, trước tiên bạn cần đăng ký bằng cách hoàn thành [quy trình đăng ký Issuer](https://github.com/GoogleChrome/private-tokens/blob/main/PST-Registration.md). Mở một [issue](https://github.com/GoogleChrome/private-tokens/issues/new) mới trên [Google private-tokens GitHub repository](https://github.com/GoogleChrome/private-tokens) sử dụng template "New PST Issuer". Làm theo hướng dẫn trên repository để điền vào issue. Sau khi endpoint được xác minh, nó sẽ được hợp nhất vào repository này và cơ sở hạ tầng phía server của Chrome sẽ bắt đầu tải các khóa đó.

> [!NOTE]
> Quy trình này do Google quản lý và kiểm soát việc phát hành token qua trình duyệt Chromium; các triển khai khác có thể chọn sử dụng quy trình khác.

### Tạo issuer server

Để triển khai issuer server, bạn cần xây dựng ứng dụng phía server của riêng mình, cung cấp các HTTP endpoint. Thành phần issuer gồm hai module chính:

1. Ứng dụng issuer
2. Token issuer

![Các thành phần chính của issuer server: Ứng dụng Issuer được xây dựng với ví dụ như Node.js, và token issuer (thành phần mật mã chịu trách nhiệm phát hành token](issuer.png)

Trong ví dụ triển khai:

1. Ứng dụng issuer là [Node.js server sử dụng framework Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs) để host các HTTP endpoint issuer. Xem [mã nguồn mẫu của ứng dụng](https://github.com/GoogleChromeLabs/private-state-token-demo/blob/main/src/index.js).
2. Thành phần mật mã token issuer không yêu cầu ngôn ngữ cụ thể nhưng do yêu cầu hiệu suất, chúng tôi cung cấp triển khai C làm ví dụ, sử dụng thư viện [Boring SSL](https://boringssl.googlesource.com/boringssl/) để quản lý token. Xem [ví dụ mã thành phần mật mã và thêm thông tin về cài đặt](https://github.com/GoogleChromeLabs/private-state-token-demo/tree/main?tab=readme-ov-file#private-state-token-demo).
3. Thành phần token issuer sử dụng các khóa đường cong elliptic (EC) tùy chỉnh để mã hóa token. Các khóa này phải được bảo vệ và lưu trữ trong bộ nhớ an toàn.

#### Yêu cầu kỹ thuật của issuer server

Theo Privacy Pass protocol, bạn cần triển khai ít nhất hai HTTP endpoint trong issuer server:

- Key commitment: Đây là endpoint chứa chi tiết khóa công khai mã hóa của bạn để các trình duyệt xác nhận server của bạn là hợp lệ. Endpoint này phải nằm trong thư mục well-known tại tên miền đăng ký của issuer server tại `/.well-known/private-state-token/key-commitment`. Xem [ví dụ Key-commitment endpoint](https://github.com/GoogleChromeLabs/private-state-token-demo/blob/bf173919620f2b8203a628c3a1094c8846e6aff1/src/index.js#L55).
- Token issuance: Endpoint phát hành token là nơi xử lý tất cả các yêu cầu token. Endpoint này là điểm tích hợp cho thành phần token issuer. Nó phải nằm trên issuer server tại `/.well-known/private-state-token/issuance`. Xem [ví dụ Token issuance endpoint](https://github.com/GoogleChromeLabs/private-state-token-demo/blob/bf173919620f2b8203a628c3a1094c8846e6aff1/src/index.js#L81).

Do lưu lượng truy cập cao dự kiến trên server như vậy, chúng tôi khuyên bạn nên triển khai nó bằng cơ sở hạ tầng có thể mở rộng (ví dụ môi trường đám mây) để có thể điều chỉnh backend dựa trên nhu cầu biến động.

### Phát hành token qua server của bạn

Sau khi thiết lập issuer server, trang web issuer của bạn có thể phát hành token mới bằng cách thực hiện fetch request đến endpoint phát hành token. Fetch request cần bao gồm đối tượng `privateToken`, trong đó các thuộc tính bắt buộc là:

- `version`
  - : Phiên bản giao thức mật mã bạn muốn sử dụng khi tạo token. Hiện tại luôn đặt là `1`, đây là phiên bản duy nhất mà thông số kỹ thuật hỗ trợ.
- `operation`
  - : Thao tác token bạn đang cố gắng hoàn thành. Trong trường hợp này, đặt là `token-request`.

Bạn có thể xử lý điều này bằng lệnh gọi {{domxref("fetch()")}} với `method` đặt là `POST` và tùy chọn `privateToken` được chỉ định:

```js
const hasToken = await Document.hasPrivateToken(`issuer.example`);
if (!hasToken) {
  await fetch(
    "https://issuer.example/.well-known/private-state-token/issuance",
    {
      method: "POST",
      privateToken: {
        version: 1,
        operation: "token-request",
      },
    },
  );
}
```

> [!NOTE]
> Bạn cũng có thể phát hành yêu cầu thao tác token sử dụng:
>
> - {{domxref("XMLHttpRequest")}} với `privateToken` được chỉ định bên trong lệnh gọi {{domxref("XMLHttpRequest.setPrivateToken()")}}
> - Các phần tử {{htmlelement("iframe")}} với `privateToken` được bao gồm dưới dạng chuỗi bên trong thuộc tính [`privateToken`](/en-US/docs/Web/HTML/Reference/Elements/iframe#privatetoken).

Ở hậu trường, trình duyệt tạo ra một tập hợp nonces cần thiết để tạo token, làm mù chúng và gửi đến issuer server trong header yêu cầu {{httpheader("Sec-Private-State-Token")}} như một phần của fetch request. Ngoài ra, phiên bản giao thức mật mã dùng để tạo nonces được gửi đến issuer server trong header yêu cầu {{httpheader("Sec-Private-State-Token-Crypto-Version")}}.

Lưu ý rằng bạn có thể sử dụng phương thức {{domxref("Document.hasPrivateToken()")}} để kiểm tra xem trình duyệt đã lưu token từ issuer của chúng ta chưa, trước khi thử yêu cầu một token khác.

Nếu yêu cầu token thành công, phản hồi sẽ bao gồm header phản hồi {{httpheader("Sec-Private-State-Token")}} chứa chữ ký mù. Trình duyệt bỏ làm mù chúng và lưu cùng với nonces gốc chưa bị làm mù trong kho token bảo mật. Cặp chữ ký và nonces này tạo thành private state token, có thể được đổi sau này. Token thô không thể truy cập từ JavaScript.

### Giới hạn phát hành token

Mỗi thiết bị có thể lưu tối đa 500 token cho mỗi trang web cấp cao nhất và issuer. Số lượng issuer tối đa cho mỗi nguồn gốc cấp cao nhất là hai.

Mỗi token có metadata cho biết issuer đã sử dụng khóa nào để phát hành nó. Thông tin này có thể được dùng để quyết định đổi token (hoặc không) trong quá trình đổi thưởng. Mỗi token chỉ có thể được phát hành bằng một và chỉ một khóa mật mã duy nhất, và mỗi issuer có thể có tối đa 6 khóa. Một cách tiềm năng sử dụng biến số này là xác định phạm vi tin cậy cho token dựa trên các khóa mật mã (ví dụ: khóa 1: tin cậy cao; khóa 6: không tin cậy).

Trình duyệt có thể lấy tập hợp khóa hợp lệ hiện tại của issuer từ endpoint key commitment. Khóa nên được xoay vòng thường xuyên; điều này có thể được thực hiện tối thiểu mỗi 60 ngày; bất kỳ vòng xoay nào nhanh hơn sẽ bị bỏ qua. Tất cả token được phát hành bằng khóa không hợp lệ cũng được coi là không hợp lệ.

## Đổi token

Phần này hướng dẫn quy trình thiết lập redeemer server, đổi token và phát hành redemption record.

### Tạo redeemer server

Bạn cần xây dựng redeemer server để đọc các token được phát hành bởi issuer server. Các bước sau phác thảo cách đổi token cũng như cách đọc redemption record liên quan đến các token đó.

Thành phần redeemer gồm hai module chính:

1. Ứng dụng redeemer
2. Token redeemer

![Các thành phần chính của redeemer server: Ứng dụng Redeemer được xây dựng với ví dụ như Node.js, và Token redeemer (thành phần mật mã chịu trách nhiệm xác minh chữ ký và token trong quá trình đổi thưởng)](redeemer.png)

Bạn có thể chọn chạy issuer và redeemer trên cùng một server (hoặc nhóm server) và thành phần mật mã. Trên thực tế, đây là những gì đã được thực hiện trong ví dụ triển khai, để dễ theo dõi hơn. Một lần nữa, hãy xem [mã nguồn mẫu của ứng dụng](https://github.com/GoogleChromeLabs/private-state-token-demo/blob/main/src/index.js) và [ví dụ mã thành phần mật mã và thông tin về cài đặt](https://github.com/GoogleChromeLabs/private-state-token-demo/tree/main?tab=readme-ov-file#private-state-token-demo).

#### Yêu cầu kỹ thuật của redeemer server

Theo Privacy Pass protocol, bạn cần triển khai ít nhất một HTTP endpoint trong redeemer server:

- Token redemption: Đây là nơi xử lý tất cả việc đổi token. Endpoint này là điểm tích hợp cho thành phần token redeemer. Nó phải nằm trên issuer server tại `/.well-known/private-state-token/redemption`. Xem [ví dụ Token redemption endpoint](https://github.com/GoogleChromeLabs/private-state-token-demo/blob/bf173919620f2b8203a628c3a1094c8846e6aff1/src/index.js#L98) của chúng tôi.

### Đổi token qua server của bạn

Sau khi thiết lập redeemer server, trang web redeemer của bạn có thể đổi token đã lưu trước đó bằng cách thực hiện fetch request đến endpoint đổi token. Fetch request cần bao gồm đối tượng `privateToken`, tương tự như trong yêu cầu phát hành token, ngoại trừ `operation` được chỉ định là `token-redemption`.

Bạn có thể xử lý điều này bằng lệnh gọi {{domxref("fetch()")}} với `method` đặt là {{httpmethod("POST")}} và tùy chọn `privateToken` được chỉ định.

```js
await fetch(
  "https://issuer.example/.well-known/private-state-token/redemption",
  {
    method: "POST",
    privateToken: {
      version: 1,
      operation: "token-redemption",
      refreshPolicy: "none",
    },
  },
);
```

Ở đây chúng ta cũng đặt thuộc tính `refreshPolicy` là `none`, nghĩa là nếu có redemption record chưa hết hạn đã được đặt trước đó cho người dùng và trang web này, redemption record đó nên được sử dụng và không nên phát hành cái mới. Nếu đặt `refreshPolicy: "refresh"`, redemption record mới sẽ luôn được phát hành. Lưu ý rằng `none` là giá trị mặc định, vì đây là hành vi bạn sẽ muốn trong hầu hết các trường hợp, nhưng chúng tôi muốn nhấn mạnh điều này.

Ở hậu trường, trình duyệt gửi token (cùng với metadata đổi thưởng liên quan) được đính kèm trong header yêu cầu {{httpheader("Sec-Private-State-Token")}}. Redeemer sau đó gửi Redemption Record trong header phản hồi `Sec-Private-State-Token` để cung cấp xác nhận đổi thưởng cho việc truyền đạt tin cậy người dùng. Redemption record được lưu trong kho dữ liệu bảo mật không thể truy cập trực tiếp qua JavaScript.

Ngoài ra, redeemer có thể bao gồm header {{httpheader("Sec-Private-State-Token-Lifetime")}} trong phản hồi để cho trình duyệt biết redemption record nên được lưu cache trong bao lâu (tính bằng giây). Nếu bỏ qua header `Sec-Private-State-Token-Lifetime`, thời hạn của redemption record sẽ gắn với thời hạn của khóa xác minh token đã xác nhận việc phát hành token được đổi.

### Giới hạn redemption record

Hai token có thể được đổi mỗi 48 giờ, mỗi thiết bị, trang và issuer.

Các redemption record kết quả được coi là hoạt động cho đến khi hết hạn (như được chỉ định bởi header phản hồi `Sec-Private-State-Token-Lifetime`).

## Sử dụng redemption record

Sau khi trình duyệt nhận được redemption record, nó có thể được sử dụng như tín hiệu tin cậy cho người dùng hiện tại trong các ngữ cảnh khác, ví dụ khi cho phép họ thực hiện các hành động nhạy cảm như đăng nhập, mua sản phẩm hoặc đăng bình luận.

Tín hiệu tin cậy này có thể được chuyển tiếp cho các bên khác để truyền đạt tin cậy. Để làm vậy, bao gồm tùy chọn `privateToken` trong các lệnh fetch cho các tài nguyên tương lai, với `operation` là `send-redemption-record`:

```js
const hasRR = await Document.hasRedemptionRecord(`issuer.example`);
if (hasRR) {
  await fetch("some-resource.example", {
    method: "POST",
    privateToken: {
      version: 1,
      operation: "send-redemption-record",
      issuers: ["https://issuer.example"],
    },
  });
}
```

Thao tác token `send-redemption-record` chỉ khả dụng trên các lệnh gọi `fetch()` được thực hiện trong tài liệu cấp cao nhất.

Chúng ta cũng đặt thuộc tính `issuers` là `[issuer.example]`, chỉ định issuer nào chúng ta kỳ vọng redemption record đến từ. Nếu không có redemption record nào cho (các) issuer được chỉ định, header yêu cầu sẽ rỗng. Lưu ý rằng bạn có thể sử dụng phương thức {{domxref("Document.hasRedemptionRecord()")}} để kiểm tra xem trình duyệt có redemption record có nguồn gốc từ một issuer cụ thể không, trước khi thử chuyển tiếp nó.

Ở hậu trường, (các) redemption record sẽ được bao gồm trên header yêu cầu {{httpheader("Sec-Redemption-Record")}}. Header chứa danh sách các cặp issuer và redemption record tương ứng với mỗi redemption record.

## Tích hợp Permissions policy

Các thao tác `token-request` được kiểm soát bởi chỉ thị {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} của {{httpheader("Permissions-Policy")}}, trong khi các thao tác `token-redemption` và `send-redemption-record` được kiểm soát bởi chỉ thị {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}}. Allowlist cho các chỉ thị này được đặt thành `*` (tất cả nguồn gốc) theo mặc định. Điều này có nghĩa là tính năng khả dụng với trang cấp cao nhất, các phần tử {{htmlelement("iframe")}} cùng nguồn gốc và các phần tử `<iframe>` nguồn gốc chéo mà không cần ủy quyền rõ ràng.

Bạn có thể từ chối phát hành hoặc đổi token cho các trang cụ thể trên trang web của mình bằng cách bao gồm `private-state-token-issuance=()` và `private-state-token-redemption=()` trong header `Permissions-Policy` cho mỗi trang.

Bạn cũng có thể sử dụng header `Permissions-Policy` để kiểm soát quyền truy cập của bên thứ ba vào các thao tác token. Là tham số cho danh sách nguồn gốc của header, sử dụng self và bất kỳ nguồn gốc nào bạn muốn cho phép truy cập API. Ví dụ: để hoàn toàn vô hiệu hóa việc sử dụng private state token trong tất cả ngữ cảnh duyệt web ngoại trừ nguồn gốc của bạn và `https://example.com`, hãy đặt header phản hồi HTTP sau:

```http
Permissions-Policy: private-state-token-issuance=(self "https://example.com"), private-state-token-redemption=(self "https://example.com")
```

Để bật API cho tất cả tài nguyên nguồn gốc chéo, đặt danh sách nguồn gốc thành `*`.

Mặc dù chính sách mặc định là `*`, `<iframe>` vẫn cần bao gồm các chỉ thị `private-state-token-issuance` và `private-state-token-redemption` trong thuộc tính allow của nó để có quyền truy cập vào tính năng. Ví dụ: để cho phép cả hai tính năng được sử dụng trên `example.com`:

```html
<iframe
  src="https://example.com"
  allow="private-state-token-issuance 'self';
  private-state-token-redemption 'self'">
</iframe>
```
