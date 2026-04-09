---
title: Danh tính liên kết
slug: Web/Security/Authentication/Federated_identity
page-type: guide
sidebar: security
---

Trong một hệ thống **danh tính liên kết** (federated identity), một website ủy quyền việc xác thực cho một bên thứ ba.

- Bên thứ ba, thường được gọi là {{glossary("identity provider", "Nhà cung cấp danh tính (IdP)")}}, quản lý thông tin xác thực của người dùng và có thể xác thực người dùng.
- Website, thường được gọi là {{glossary("relying party", "Bên phụ thuộc (RP)")}}, tin cậy IdP để đưa ra khẳng định về danh tính của người dùng.

Khi người dùng muốn đăng nhập vào website, website sẽ chuyển hướng họ đến IdP. Người dùng xác thực với IdP, và IdP trả về một token cho website, cho biết người dùng đã xác thực thành công. Website kiểm tra token có hợp lệ hay không, và nếu hợp lệ thì đăng nhập người dùng.

![Tổng quan về đăng nhập bằng danh tính liên kết.](federated-identity-overview.svg)

> [!NOTE]
> Danh tính liên kết thực ra không hẳn là một _phương thức_ xác thực: nó giống một _kiến trúc_ hơn, trong đó có thể dùng nhiều phương thức xác thực khác nhau. Tức là, một IdP có thể chọn xác thực người dùng bằng một hoặc nhiều phương thức, như mật khẩu truyền thống, mật khẩu dùng một lần, sinh trắc học, hoặc passkey.

Mô hình này có một số lợi ích cho cả người dùng lẫn website:

- Website không phải tự triển khai xác thực, hoặc xử lý an toàn {{glossary("credential", "thông tin xác thực")}} của người dùng.
- Một IdP duy nhất có thể xác thực người dùng cho nhiều website khác nhau. Điều này có nghĩa là người dùng không phải dùng một bộ thông tin xác thực khác nhau cho từng site: nếu thông tin xác thực là mật khẩu, điều này giảm rủi ro dùng lại mật khẩu hoặc chọn mật khẩu yếu, dễ nhớ.
- Nếu người dùng đã có tài khoản với một IdP mà website của bạn tin cậy để xác thực người dùng, thì việc đăng ký vào site của bạn sẽ dễ hơn nhiều, vì họ không cần tạo thông tin xác thực mới riêng cho site của bạn.

Trong hướng dẫn này, chúng ta sẽ tìm hiểu cách một website có thể làm việc với IdP để thêm đăng nhập liên kết cho người dùng của họ. Chúng ta sẽ bao quát:

- Các luồng chính được định nghĩa trong giao thức [OpenID Connect (OIDC)](https://openid.net/developers/how-connect-works/), vốn là tiêu chuẩn chủ đạo cho danh tính liên kết, và các thực hành tốt nên áp dụng khi triển khai.
- Cách các giới hạn của trình duyệt đối với cookie bên thứ ba tạo ra vấn đề cho các triển khai danh tính liên kết.
- [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API), vốn làm cho vai trò của trình duyệt chủ động hơn rất nhiều, nhằm đơn giản hóa vai trò của RP và tránh phụ thuộc vào cookie bên thứ ba.
- Cách một website có thể chọn IdP để làm việc cùng, và việc lựa chọn này có thể ảnh hưởng thế nào đến quá trình triển khai đăng nhập liên kết.

## OpenID Connect

Tiêu chuẩn được dùng phổ biến nhất cho danh tính liên kết trên web là [OpenID Connect (OIDC)](https://openid.net/developers/how-connect-works/), một giao thức xác thực được xây dựng trên nền tảng của khung ủy quyền [OAuth 2.0 authorization framework](https://datatracker.ietf.org/doc/html/rfc6749).

### Luồng xác thực

Trong phần này, chúng ta sẽ bắt đầu bằng cách đi qua luồng xác thực chính do OIDC định nghĩa. Có nhiều tùy chọn trong luồng xác thực OIDC: trong phần trình bày này chúng ta sẽ nêu các tùy chọn được khuyến nghị, và sẽ nói về các phương án thay thế sau.

Luồng này được định nghĩa trong đặc tả [OpenID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html).

Là điều kiện tiên quyết, RP cần được IdP biết đến:

- IdP cần có một định danh cho RP, gọi là client ID
- RP phải có khả năng xác thực chính nó với IdP

Việc xác thực có thể dùng một bí mật dùng chung gọi là client secret hoặc một cơ chế khác như xác thực client TLS.

> [!NOTE]
> Các đặc tả OpenID dùng thuật ngữ "OpenID Provider" (OP) để chỉ thứ mà chúng ta gọi là IdP trong hướng dẫn này.

![Luồng xác thực OIDC](oidc-auth-flow.svg)

Điều đầu tiên cần lưu ý ở đây là luồng này gồm hai phần.

- **Yêu cầu xác thực**: RP gửi yêu cầu tới _authorization endpoint_ của IdP, yêu cầu IdP xác thực người dùng. IdP xác thực người dùng và trả về một _authorization code_ cho RP. Mã này hết hạn sau một khoảng thời gian ngắn (khuyến nghị không quá 10 phút).
- **Yêu cầu token**: RP gửi authorization code tới một endpoint khác của IdP, gọi là _token endpoint_, và endpoint này phản hồi bằng một đối tượng chứa hai token:
  - Một _access token_, cho phép người dùng truy cập các tài nguyên cụ thể trên website (giống như API key)
  - Một _ID token_, xác định người dùng, và cho phép RP đăng nhập người dùng.

Trong yêu cầu xác thực:

1. Người dùng yêu cầu đăng nhập vào RP.

2. RP chuyển hướng trình duyệt đến authorization endpoint của IdP, yêu cầu nó xác thực người dùng. RP có thể cung cấp nhiều tham số cùng yêu cầu, bao gồm:
   - `client_id`: Xác định RP này với IdP.
   - `response_type`: Luôn là `"code"` nếu chúng ta dùng luồng hai phần được mô tả ở đây, vốn là tùy chọn được khuyến nghị.
   - `redirect_uri`: URL trong RP mà IdP nên chuyển hướng tới sau khi cố gắng xác thực người dùng. Đây là URL mà IdP sẽ gửi authorization code tới.
   - `code_challenge`: Một {{glossary("hash")}} mật mã của một bí mật riêng cho yêu cầu xác thực này, sẽ được token endpoint dùng để bảo đảm token request thực sự là phần tương ứng của authentication request này.
   - `scope`: Danh sách các chuỗi chỉ định những tập dữ liệu người dùng nào RP muốn truy cập.

3. IdP xác thực người dùng. Giao thức không chỉ định phương thức cụ thể nào ở đây: IdP có thể dùng mật khẩu, mật khẩu dùng một lần, sinh trắc học, hoặc bất kỳ phương thức phù hợp nào khác.

4. Nếu xác thực thành công, IdP tạo authorization code. Nó cũng lưu giá trị `code_challenge`, và liên kết nó với authorization code. Sau đó IdP chuyển hướng trình duyệt tới redirect URL của RP, truyền authorization code như một tham số.

Trong yêu cầu token:

1. RP gửi yêu cầu {{httpmethod("POST")}} tới token endpoint của IdP. Yêu cầu này bao gồm các tham số sau:
   - `client_id`: Xác định RP này với IdP.
   - `client_secret`: Bí mật dùng để xác thực RP với IdP: đây có thể là bất kỳ giá trị nào đã được RP và IdP đồng thuận trước đó. Thay vì bí mật dùng chung, RP và IdP cũng có thể dùng cơ chế khác để xác thực client, chẳng hạn xác thực client TLS.
   - `grant_type`: Phải là `"authorization_code"`.
   - `code`: Authorization code.
   - `code_verifier`: Bí mật gốc đã được dùng để tạo tham số `code_challenge` trong yêu cầu xác thực.

2. IdP xác thực yêu cầu:
   - Nó xác thực rằng yêu cầu đến từ RP cụ thể bằng client secret hoặc một hình thức xác thực client khác.
   - Nó băm tham số `code_verifier`, rồi kiểm tra kết quả có khớp với `code_challenge` hay không.

3. Nếu yêu cầu hợp lệ, IdP phản hồi với hai token:
   - Một access token, cho phép người dùng truy cập một số tài nguyên trong RP.
   - Một ID token, xác định người dùng. Đây là một [JSON Web Token](https://www.jwt.io/) được ký bằng mật mã.

4. RP xác thực các token: trong số các kiểm tra khác, nó xác minh chữ ký của IdP trên ID token. Nếu xác thực thành công, RP đăng nhập người dùng.

### Tính năng bảo mật

Trong phần này, chúng ta sẽ tóm tắt các tính năng bảo mật chính của luồng xác thực OIDC vừa mô tả. Để biết đầy đủ chi tiết, xem [Best Current Practice for OAuth 2.0 Security](https://www.rfc-editor.org/rfc/rfc9700.html).

#### Authorization code flow

Luồng hai bước chúng ta vừa mô tả được gọi là "authorization code flow". Trong một luồng thay thế, gọi là "implicit flow", chỉ có bước đầu tiên, và phản hồi cho yêu cầu xác thực đã chứa sẵn access token và ID token. Cách này không an toàn, vì token bị lộ ra cho phần front end của RP, vốn được xem là kém an toàn hơn nhiều so với back end. Ví dụ, trong một cuộc tấn công [XSS](/en-US/docs/Web/Security/Attacks/XSS) thành công, hoặc nếu người dùng cài đặt một tiện ích trình duyệt độc hại, kẻ tấn công có thể đánh cắp token của người dùng.

Vì lý do này, website luôn nên dùng authorization code flow. Ngay cả khi kẻ tấn công đánh cắp được authorization code, chúng vẫn phải thuyết phục token endpoint cấp token cho chúng để đổi lấy mã đó.

#### Xác thực client

Trong luồng đã mô tả, RP xác thực chính nó với token endpoint khi thực hiện token request. Điều này có nghĩa là nếu kẻ tấn công thật sự đánh cắp được authorization code, chúng vẫn phải mạo danh RP thành công mới lấy được token từ IdP.

Đặc tả OAuth phân biệt giữa các [_client bí mật_ và _client công khai_](https://datatracker.ietf.org/doc/html/rfc6749#section-2.1). Client bí mật về cơ bản là các RP có thể giữ bí mật, còn client công khai là những bên không thể.

Đặc tả xem các client chạy trên trình duyệt của người dùng là client công khai, vì lý do chúng ta đã gặp: quá dễ để kẻ tấn công truy cập bí mật trong trình duyệt thông qua các cuộc tấn công như XSS. Client chạy trên web _server_ là client bí mật.

Trong OIDC, chỉ client bí mật mới được dùng xác thực client, vì chỉ client bí mật mới có thể được tin cậy để duy trì an toàn cho thông tin xác thực của client.

RP có thể xác thực với IdP bằng một bí mật dùng chung, nhưng [tốt hơn là nên dùng một phương thức dựa trên mật mã khóa công khai](https://www.rfc-editor.org/rfc/rfc9700.html#name-client-authentication), chẳng hạn xác thực client {{glossary("TLS")}}.

#### Proof Key for Code Exchange (PKCE)

Các giá trị `code_challenge` và `code_verifier` mà RP cung cấp trong yêu cầu xác thực và yêu cầu token tương ứng là một phần của cơ chế gọi là _Proof Key for Code Exchange_ (PKCE), được chỉ định trong {{rfc("7636")}}.

Trong yêu cầu xác thực:

- RP tạo ra một giá trị khó đoán và chỉ riêng cho yêu cầu xác thực này. Giá trị này được gọi là _code verifier_.
- RP tạo một {{glossary("hash", "hash mật mã")}} của code verifier, và dùng nó làm tham số `code_challenge` trong yêu cầu xác thực.
- IdP lưu code challenge, và liên kết nó với authorization code mà nó trả về cho RP.

Trong yêu cầu token:

- RP truyền code verifier trong tham số _code_verifier_.
- IdP băm code verifier, và so sánh kết quả với code challenge đã lưu: nếu chúng không khớp, token request sẽ bị từ chối.

PKCE bảo vệ khỏi hai cuộc tấn công: [CSRF vào redirect URL của RP](#csrf_against_the_redirect_url), và [chèn authorization code](#authorization_code_injection).

##### CSRF vào redirect URL

Trong một cuộc tấn công CSRF, kẻ tấn công lừa trình duyệt của người dùng đăng nhập họ vào tài khoản của kẻ tấn công. Điều này có thể gây nhiều hậu quả xấu: ví dụ, bất kỳ dữ liệu riêng tư nào người dùng tải lên tài khoản sẽ có sẵn cho kẻ tấn công và do kẻ tấn công kiểm soát.

Nếu không dùng PKCE, cuộc tấn công CSRF hoạt động như sau:

1. Kẻ tấn công yêu cầu đăng nhập vào RP. RP gửi yêu cầu xác thực tới IdP và kẻ tấn công xác thực với IdP.

2. IdP tạo authorization code cho kẻ tấn công, và chuyển hướng trình duyệt của kẻ tấn công tới redirect URL của RP, với authorization code là tham số URL.

3. Kẻ tấn công chặn chuyển hướng này, trích xuất redirect URL bao gồm authorization code, rồi chấm dứt luồng.

4. Kẻ tấn công lừa người dùng nhấp vào redirect URL. Với RP, điều này trông giống như một phản hồi từ IdP cho một yêu cầu xác thực phát sinh từ người dùng.

5. RP gửi token request tới IdP, bao gồm authorization code của kẻ tấn công, mà nó lấy từ redirect URL.

6. IdP phản hồi bằng token của kẻ tấn công.

7. RP đăng nhập người dùng vào tài khoản của kẻ tấn công: lúc này mọi thông tin hoặc chỉ dẫn họ cung cấp đều nằm dưới quyền kiểm soát của kẻ tấn công.

Về bản chất, cuộc tấn công thành công vì RP không biết rằng yêu cầu tới redirect URL không phải là phản hồi cho một yêu cầu được thực hiện thay mặt người dùng.

Khi dùng PKCE:

- Ở bước 1, RP tạo một code verifier cho yêu cầu của kẻ tấn công, và gửi code verifier đã băm (code challenge) tới IdP.
- Ở bước 2, IdP lưu code challenge cùng với authorization code của kẻ tấn công.
- Ở bước 5, RP sẽ không thể tìm thấy code verifier cho người dùng khớp với challenge mà IdP đã lưu, nên token request sẽ thất bại.

Một biện pháp phòng thủ thay thế là tham số `state` được định nghĩa trong OAuth 2.0. Trong biện pháp này, RP cung cấp một giá trị khó đoán làm tham số trong yêu cầu xác thực, và IdP đưa cùng giá trị đó vào phản hồi: RP kiểm tra xem chúng có khớp hay không. Vì kẻ tấn công không thể đoán giá trị `state`, họ không thể đưa giá trị khớp vào redirect URL của RP.

##### Chèn authorization code

Trong một cuộc tấn công chèn authorization code, kẻ tấn công đánh cắp authorization code từ người dùng mục tiêu, và có thể chèn nó vào luồng đăng nhập của chính mình. Kết quả là kẻ tấn công được đăng nhập vào tài khoản của người dùng.

Người ta thường chấp nhận rằng authorization code trong OIDC dễ bị tấn công, một phần vì chúng bị phơi ra cho trình duyệt của người dùng. Ví dụ, nếu người dùng cài một tiện ích trình duyệt độc hại, nó có thể đánh cắp authorization code.

Biện pháp giảm thiểu chính ở đây là [xác thực client](#client_authentication): vì RP xác thực với IdP khi nó gửi token request, kẻ tấn công không thể đơn giản tự gửi token request của riêng mình với mã đã đánh cắp. Tuy nhiên, trong tấn công chèn authorization code, chính RP thật đang gửi token request, nên xác thực client sẽ thành công.

Nếu không dùng PKCE, cuộc tấn công chèn authorization code hoạt động như sau:

1. Kẻ tấn công có thể đánh cắp authorization code của người dùng. Ví dụ, người dùng đã cài một tiện ích trình duyệt độc hại có thể truy cập các URL mà trình duyệt ghé thăm.

2. Người dùng cố gắng đăng nhập. RP gửi yêu cầu xác thực, người dùng xác thực, và IdP chuyển hướng trình duyệt tới redirect URL của RP, với authorization code là tham số URL.

3. Tại thời điểm này, tiện ích trình duyệt độc hại lấy authorization code, gửi nó cho kẻ tấn công, và chấm dứt luồng xác thực của người dùng.

4. Kẻ tấn công nhận được authorization code của người dùng.

5. Kẻ tấn công bắt đầu luồng xác thực OIDC riêng của mình, nhưng chặn phản hồi xác thực từ IdP, thay authorization code bằng mã mà nó đánh cắp từ người dùng. Điều này rất đơn giản, vì phản hồi xác thực là dành cho kẻ tấn công, nên nó đi qua thiết bị của kẻ tấn công.

6. RP sau đó tiếp tục luồng xác thực cho kẻ tấn công bằng cách gửi token request tới IdP, bao gồm authorization code của người dùng mà kẻ tấn công đã chèn vào.

7. IdP phản hồi bằng token của người dùng.

8. RP đăng nhập kẻ tấn công vào tài khoản của người dùng.

Lưu ý rằng dùng tham số `state` không giúp ích trong trường hợp này, vì yêu cầu và phản hồi xác thực thực sự thuộc cùng một luồng - luồng của kẻ tấn công.

PKCE bảo vệ chống lại cuộc tấn công này, vì:

- Ở bước 2, RP tạo code verifier và gửi code challenge đã băm tới IdP, và IdP lưu challenge cùng với code của người dùng.
- Ở bước 6, token request của RP chứa code verifier của _kẻ tấn công_ nhưng code của _người dùng_. IdP tra cứu code challenge cho code của người dùng: nó sẽ không khớp với code verifier của kẻ tấn công, và token request sẽ bị từ chối.

Một thay thế cho PKCE, được chỉ định trong OIDC, là giá trị [`nonce`](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics#name-nonce). RP bao gồm giá trị này như một tham số khác trong yêu cầu xác thực: IdP lưu nó, và token endpoint trả nó về cho RP cùng với các token. Sau đó RP kiểm tra rằng giá trị trả về giống với giá trị ban đầu.

##### Bảo đảm PKCE được dùng

Để bảo đảm PKCE được dùng, RP phải xác nhận rằng IdP mà mình chọn không chỉ hỗ trợ PKCE, mà còn _bắt buộc_ sử dụng PKCE - từ chối token request nếu không có code verifier hợp lệ.

Nếu không, RP sẽ dễ bị [tấn công hạ cấp PKCE](https://datatracker.ietf.org/doc/html/rfc9700#name-pkce-downgrade-attack), trong đó kẻ tấn công lừa IdP nghĩ rằng RP không muốn dùng PKCE trong một token request.

### Kiến trúc cho client OIDC

Đặc tả [OAuth 2.0 for Browser-Based Applications](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps-25) mô tả cách kiến trúc ứng dụng web có thể ảnh hưởng đến các mối đe dọa bảo mật mà client OIDC (tức là RP) phải đối mặt, và đưa ra một số khuyến nghị về kiến trúc ứng dụng web.

Cụ thể, đặc tả này nhận thấy rằng:

- Mẫu an toàn nhất là khi website dùng một web server để xử lý mọi tương tác OAuth/OIDC và mọi tương tác với API được bảo vệ bởi access token. Trong mẫu này, RP có thể là client bí mật, vì nó có thể giữ client secret trong server. Nó cũng có thể giữ toàn bộ token trong server, kể cả access token.

- Mẫu an toàn kế tiếp là khi website dùng một web server để xử lý mọi tương tác OAuth/OIDC, nhưng sau đó trả access token về front end, và front end trực tiếp gửi yêu cầu API. Trong kịch bản này, website có thể là client bí mật nhưng mã độc chạy trong trình duyệt (ví dụ, qua tấn công XSS) vẫn có thể đánh cắp access token. Tuy nhiên, front end không cần lưu access token lâu dài: nó có thể lấy chúng từ backend khi cần.

- Mẫu kém an toàn nhất là khi cả tương tác OAuth/OIDC lẫn tương tác với API đều diễn ra ở front end. Đây, chẳng hạn, sẽ là kiến trúc tự nhiên cho một ứng dụng chạy hoàn toàn trong trình duyệt. Trong kiến trúc này, RP không thể là client bí mật, vì nó không thể giữ client secret một cách đáng tin cậy. Điều này có nghĩa là nó không thể tự xác thực với IdP. Nó cũng phải lưu token một cách lâu dài, làm tăng rủi ro mã độc đánh cắp chúng.

Đặc tả cũng bao gồm các khuyến nghị chi tiết về thực hành bảo mật nên tuân theo trong từng trong ba kịch bản này.

### Đăng xuất OIDC

Các kịch bản đăng xuất trong một hệ thống danh tính liên kết phức tạp hơn trong một hệ thống không liên kết, vì:

- Người dùng có thể đăng xuất khỏi RP либо trên site của RP, либо trên site của IdP.
- Người dùng có thể chọn chỉ đăng xuất khỏi RP, hoặc đăng xuất toàn cục: tức là đăng xuất khỏi tất cả RP mà họ đã đăng nhập bằng IdP này. Đây là yêu cầu phổ biến khi chúng ta dùng danh tính liên kết để xây dựng một hệ thống {{glossary("single sign-on", "đăng nhập một lần (SSO)")}}, trong đó một nhân viên có thể dùng một bộ thông tin xác thực doanh nghiệp duy nhất để đăng nhập vào email, hệ thống theo dõi lỗi, và diễn đàn thảo luận.

Hỗ trợ các kịch bản này có nghĩa là phải triển khai một cơ chế giao tiếp giữa RP và IdP. Ví dụ:

- Nếu người dùng đăng xuất tại IdP, thì RP nên được thông báo, và đăng xuất người dùng khỏi RP.
- Nếu người dùng đăng xuất tại RP, thì IdP nên được thông báo, và có thể đăng xuất người dùng khỏi tất cả RP mà họ hiện đang đăng nhập.

Các đặc tả OpenID định nghĩa hai cách tiếp cận chung để triển khai sự phối hợp này, gọi là "front channel logout" và "back channel logout".

Trong [front channel logout](https://openid.net/specs/openid-connect-frontchannel-1_0.html), trình duyệt được dùng để trung gian cho việc giao tiếp. Trong cách này, trang của bên gửi nhúng một {{htmlelement("iframe")}} mà nội dung được tải từ bên nhận. Ví dụ, nếu người dùng đăng xuất tại IdP, IdP có thể nhúng một `<iframe>` mà thuộc tính `src` trỏ tới URL đăng xuất của RP: khi `<iframe>` được dựng, trình duyệt gửi yêu cầu {{httpmethod("GET")}} tới URL đó, và RP hiểu đó là chỉ dẫn để đăng xuất người dùng.

Trong [back channel logout](https://openid.net/specs/openid-connect-backchannel-1_0.html), RP và IdP giao tiếp trực tiếp với nhau, bỏ qua trình duyệt. Ví dụ, khi IdP cần báo RP đăng xuất người dùng, IdP gửi yêu cầu {{httpmethod("POST")}} trực tiếp tới RP.

## Cookie bên thứ ba

Khi triển khai một hệ thống danh tính liên kết, chúng ta phải phối hợp tương tác giữa RP, IdP và người dùng. Một số triển khai của việc phối hợp này phụ thuộc vào hỗ trợ của trình duyệt cho [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies).

Ví dụ, trong front-channel logout (một trong các cách triển khai [đăng xuất trong OpenID Connect](#oidc_sign-out)) chúng ta dùng các phần tử {{htmlelement("iframe")}} liên trang, trong đó tài liệu của RP chứa một `<iframe>` mà nội dung được tải từ IdP, hoặc ngược lại. Điều này phụ thuộc vào việc `<iframe>` được nhúng có thể gửi cookie của nó tới origin của nó.

Tương tự, trong khi [luồng xác thực OpenID Connect](#authentication_flow) chính dùng chuyển hướng toàn trang để phối hợp giữa các bên tham gia, trải nghiệm này gây sao nhãng cho người dùng và khó hỗ trợ cho {{glossary("SPA", "ứng dụng một trang")}}. Có thể đạt được trải nghiệm tốt hơn bằng cách nhúng IdP như một `<iframe>` trong trang của RP, và điều này cũng lại phụ thuộc vào cookie bên thứ ba.

Tuy nhiên, vì cookie bên thứ ba được dùng rộng rãi để [theo dõi người dùng](/en-US/docs/Web/Privacy/Guides/Third-party_cookies#what_is_the_problem_with_third-party_cookies), các trình duyệt đã thực hiện các bước để loại bỏ và ngừng hỗ trợ chúng, và hiện nay chúng không được hỗ trợ theo mặc định trong một số trình duyệt.

Do đó, chúng tôi khuyến nghị không triển khai các tính năng danh tính liên kết theo cách phụ thuộc vào cookie bên thứ ba.

## FedCM API

[Federated Credential Management API (FedCM API)](/en-US/docs/Web/API/FedCM_API) cung cấp hỗ trợ tích hợp sẵn trong trình duyệt cho danh tính liên kết. Chúng tôi chưa thể hoàn toàn khuyến nghị sử dụng nó, vì API này chưa có hỗ trợ xuyên trình duyệt và vẫn đang được phát triển tích cực. Tuy vậy, nó hứa hẹn một số lợi ích so với việc triển khai trực tiếp một giao thức như OpenID Connect:

- Trong luồng OIDC đã mô tả trước đó, website dùng OIDC (tức là RP) phải phối hợp tương tác giữa chính nó, người dùng và IdP. Như chúng ta đã thấy, điều này phức tạp và vì thế dễ sinh lỗi. Với FedCM, trình duyệt đảm nhiệm tương tác này: với tư cách RP, bạn gọi một API trình duyệt, và trình duyệt tìm IdP, yêu cầu người dùng xác thực, rồi trả về một token từ IdP mà RP có thể dùng để đăng nhập người dùng.
- Hệ quả của điều này là bạn không phải phụ thuộc vào cookie bên thứ ba, nên FedCM sẽ hoạt động trên các trình duyệt chặn chúng.
- Trong FedCM, giao diện mà người dùng xác thực với IdP được tích hợp vào trình duyệt, mang lại trải nghiệm nhất quán và liền mạch hơn mà không cần chuyển hướng.

FedCM được tích hợp vào [Credential Management API](/en-US/docs/Web/API/Credential_Management_API), một khung cho phép trình duyệt làm việc với nhiều loại thông tin xác thực khác nhau. Để xác thực bằng FedCM API, bạn gọi {{domxref("CredentialsContainer.get()")}}, truyền vào các tùy chọn khác nhau bao gồm:

- Định danh của IdP mà người dùng có thể dùng để đăng nhập vào RP này
- Ngữ cảnh mà RP đang dùng IdP đó (ví dụ, người dùng đang đăng ký hay đang đăng nhập).

Khi bạn gọi `CredentialsContainer.get()`, trình duyệt sẽ:

- Kết nối với các IdP mà bạn đã chỉ định
- Yêu cầu người dùng đăng nhập vào IdP đã chọn của họ, nếu họ chưa đăng nhập
- Yêu cầu IdP xác minh danh tính người dùng
- Trả về một token mà RP có thể dùng để đăng nhập người dùng.

### FedCM và các giao thức danh tính liên kết

FedCM tự nó không triển khai một giao thức danh tính liên kết như OIDC. Có thể xem nó như cung cấp đường truyền giữa RP, người dùng và IdP, nhưng nó không quan tâm tới những gì được trao đổi hay cách diễn giải chúng.

Ví dụ, trong một triển khai OIDC dùng FedCM, token trả về bởi `CredentialsContainer.get()` có thể là authorization code, và RP sau đó sẽ phải lấy identity token từ token endpoint của IdP. Tức là, FedCM chỉ đảm nhiệm phần đầu tiên của [luồng xác thực](#authentication_flow). Tài liệu [FedCM for OAuth](https://github.com/aaronpk/oauth-fedcm-profile) mô tả cách OAuth và OIDC có thể được triển khai bằng FedCM.

Nói chung, khi một RP quyết định dùng một IdP cụ thể cho đăng nhập liên kết, RP sẽ đăng ký với IdP, và trong quá trình này IdP nên giải thích rất rõ cho RP biết chính xác cần truyền những đối số nào, phải xử lý các đối tượng IdP trả về ra sao, và mọi hành vi khác mà nó mong RP triển khai.

## Chọn IdP

Khi bạn quyết định thêm đăng nhập liên kết cho site của mình, một trong những lựa chọn cơ bản bạn sẽ phải đối mặt là chọn những nhà cung cấp danh tính nào để làm việc cùng. Nếu một người dùng tiềm năng của site đã có tài khoản ở một trong các IdP mà bạn chọn, thì họ sẽ dễ tạo tài khoản mới trên site của bạn hơn nhiều.

Vì vậy, bạn có khả năng thấy nhiều lượt đăng ký hơn nếu một tỷ lệ lớn trong nhóm người dùng dự kiến của bạn đã có tài khoản với IdP mà bạn chọn.

Thông lệ phổ biến là cho phép người dùng đăng nhập bằng nhiều hơn một IdP, để bao phủ nhiều người dùng hơn và cho họ nhiều lựa chọn hơn. Tuy nhiên, cung cấp quá nhiều lựa chọn sẽ dẫn đến trải nghiệm người dùng khó hiểu, và những người có tài khoản ở hơn một IdP trong số đó có thể khó nhớ mình đã đăng ký bằng IdP nào.

Cũng là thông lệ phổ biến khi cung cấp một tùy chọn dự phòng cho người dùng không thể dùng bất kỳ IdP nào trong số bạn chọn. Trong tùy chọn này, người dùng xác thực trực tiếp với site của bạn bằng một phương thức như [mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords) hoặc [OTP](/en-US/docs/Web/Security/Authentication/OTP).

Bất kỳ nhà cung cấp danh tính nào bạn chọn cũng sẽ cung cấp hướng dẫn và công cụ chi tiết để tích hợp site của bạn với hệ thống của họ, và điều này nhiều khả năng sẽ xử lý được phần lớn độ phức tạp vốn có trong một giao thức như OIDC. Tuy vậy, việc hiểu chuyện gì đang diễn ra bên dưới vẫn cực kỳ hữu ích.

## Điểm mạnh và điểm yếu

Đối với nhà phát triển web, lợi ích lớn nhất của việc dùng danh tính liên kết là giảm ma sát khi đăng ký cho những người dùng đã có tài khoản ở một trong các IdP được chọn. Ngoài ra, các IdP mà họ chọn có thể giúp website triển khai danh tính liên kết an toàn hơn.

Xét từ góc độ bảo mật, lợi ích lớn nhất là vì người dùng không phải tạo thông tin xác thực mới cho từng tài khoản, nên nguy cơ họ chọn mật khẩu yếu, dễ nhớ, hoặc dùng lại mật khẩu giữa các site sẽ thấp hơn.

Dùng danh tính liên kết là một lựa chọn an toàn hơn so với chỉ dùng mật khẩu, nhưng nó vẫn có vấn đề:

- Lợi thế đối với website khi chọn các IdP có lượng người dùng lớn có nghĩa là không gian này có xu hướng bị độc quyền bởi một vài nhà cung cấp rất lớn. Điều đó lại có xu hướng khóa người dùng vào các nhà cung cấp này, khiến website phải đưa ra trải nghiệm kém hơn cho những người không muốn (hoặc không thể) dùng chúng.

- Trừ khi website sẵn sàng hoàn toàn chặn những người dùng không muốn (hoặc không thể) đăng ký bằng các IdP đã chọn, site vẫn phải xử lý toàn bộ độ phức tạp của việc triển khai một phương thức xác thực dự phòng.

- Giống như bất kỳ hệ thống xác thực nào dựa vào việc người dùng nhập bí mật vào một website, danh tính liên kết vẫn dễ bị tấn công [phishing](/en-US/docs/Web/Security/Attacks/Phishing).
