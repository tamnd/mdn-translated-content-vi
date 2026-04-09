---
title: Passkey
slug: Web/Security/Authentication/Passkeys
page-type: guide
sidebar: security
---

Passkey cho phép website xác thực người dùng mà không cần người dùng phải nhập mật khẩu hay bất kỳ mã bí mật nào khác ngay trên site. Chúng giải quyết [nhiều điểm yếu nghiêm trọng nhất của các phương thức xác thực khác](#security_properties_of_passkeys) như mật khẩu.

Thay vì dùng một bí mật dùng chung, passkey dựa vào mật mã khóa công khai. Một passkey là một {{glossary("Public-key cryptography", "cặp khóa công khai/riêng tư")}} được liên kết với tài khoản của một người dùng cụ thể trên một website cụ thể.

Khóa riêng được lưu trong một mô-đun gọi là _authenticator_, mô-đun này [nằm trong thiết bị của người dùng hoặc gắn với nó](#platform_and_roaming_authenticators). Authenticator có thể được tích hợp sẵn trong nền tảng, hoặc là một khóa phần cứng riêng như [YubiKey](https://en.wikipedia.org/wiki/YubiKey), hoặc là một ứng dụng quản lý thông tin xác thực như [KeePassXC](https://keepassxc.org/).

Khóa công khai được lưu trên server của website. Khi người dùng đăng nhập, authenticator dùng khóa riêng để {{glossary("digital signature", "ký số")}} một giá trị [_challenge_](#challenges) từ server, cùng với thông tin ngữ cảnh như {{glossary("origin")}} yêu cầu. Đối tượng tạo ra được gọi là _assertion_. Server của website có thể dùng khóa công khai để xác minh chữ ký của assertion và đăng nhập người dùng.

Trong hướng dẫn này, chúng ta sẽ:

- Giới thiệu [Web Authentication API (WebAuthn)](/en-US/docs/Web/API/Web_Authentication_API), API cho phép ứng dụng web dùng passkey.
- Đi qua hai luồng chính mà WebAuthn hỗ trợ: [đăng ký](#registration) và [đăng nhập](#sign_in).
- Tìm hiểu một số [tính năng chính của WebAuthn API](#features_of_webauthn).
- Tóm tắt [các tính chất bảo mật của passkey](#security_properties_of_passkeys).
- Xem các thực hành tốt để giúp ngăn người dùng bị khóa tài khoản nếu họ [mất passkey](#handling_lost_passkeys), giúp người dùng [quản lý passkey](#managing_passkeys), và giúp người dùng [chuyển từ mật khẩu sang passkey](#migrating_from_passwords).

## WebAuthn API

Để tương tác với authenticator, website dùng [Web Authentication API (WebAuthn)](/en-US/docs/Web/API/Web_Authentication_API). Trong đặc tả WebAuthn, một website dùng passkey để xác thực người dùng được gọi là _Relying Party_ (RP), và chúng ta sẽ dùng thuật ngữ này trong hướng dẫn.

WebAuthn là phần mở rộng của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API), một khung để quản lý {{glossary("credential", "thông tin xác thực")}} cho nhiều phương thức xác thực khác nhau, bao gồm [mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords) và [danh tính liên kết](/en-US/docs/Web/Security/Authentication/Federated_identity), cũng như passkey.

Hai hàm chính mà RP dùng là:

- {{domxref("CredentialsContainer.create()")}}, dùng để tạo passkey mới khi người dùng đăng ký trên site của bạn.
- {{domxref("CredentialsContainer.get()")}}, dùng để tạo một assertion từ passkey đã lưu của người dùng khi họ đăng nhập vào site.

## Đăng ký

Trong phần này, chúng ta sẽ đi qua luồng dùng để tạo một passkey mới và dùng nó để thiết lập một tài khoản người dùng mới.

![Tổng quan về đăng ký người dùng bằng passkey.](passkeys-register.svg)

Khi người dùng yêu cầu đăng ký trên một site, mã front-end của RP trước hết hỏi server của nó về một [_challenge_](#challenges): đây là một giá trị ngẫu nhiên do server tạo ra, và server sẽ dùng nó sau để bảo đảm passkey được tạo ra là để đáp ứng cho yêu cầu này.

Tiếp theo, mã front-end của RP gọi {{domxref("CredentialsContainer.create()")}}. Nó có thể chỉ định nhiều tùy chọn, bao gồm:

- **Tùy chọn attestation**: RP có quan tâm đến [attestation](#attestation) của authenticator hay không (một cơ chế giúp RP quyết định có nên tin cậy authenticator hay không), và nếu có thì attestation sẽ ở dạng nào.

- **Tùy chọn authenticator**: Dùng [loại authenticator](#platform_and_roaming_authenticators) nào, và authenticator có nên thực hiện [xác minh người dùng](#user_verification) trước khi tạo passkey hay không.

- **Challenge**: [Challenge](#challenges) do server của RP tạo ra. Điều này giúp chống lại các [tấn công phát lại](#challenges) {{glossary("replay attack")}}.

- **Thông tin website**: Tên và ID dễ đọc cho con người của RP sẽ được liên kết với passkey mới. ID quyết định [scope](#passkey_scope) của passkey được tạo ra.

- **Thông tin người dùng**: Thông tin về người dùng sẽ được liên kết với passkey mới, bao gồm tên hiển thị dễ đọc cho con người, một mã định danh tài khoản, và một mã định danh tài khoản dễ đọc như địa chỉ email hoặc tên người dùng.

Tùy theo khả năng của authenticator và sở thích của RP, authenticator có thể yêu cầu người dùng cho phép tạo passkey thông qua một phương thức [xác minh người dùng](#user_verification): ví dụ, dùng sinh trắc học như dấu vân tay.

Sau đó authenticator tạo passkey cho tài khoản. Nó lưu khóa riêng cục bộ và trả về một đối tượng chứa khóa công khai, challenge, cùng một số thông tin bổ sung. Nếu authenticator đang thực hiện attestation, thì toàn bộ đối tượng này được {{glossary("digital signature", "ký số")}} bằng khóa riêng hoặc một khóa [attestation](#attestation) thuộc về authenticator.

Mã front-end của RP gửi dữ liệu này lên server, server sẽ:

- Xác minh attestation, nếu có attestation
- Xác minh rằng challenge là giá trị mong đợi
- Tạo một tài khoản người dùng mới và lưu khóa công khai vào đó cùng với thông tin tài khoản của người dùng.

## Đăng nhập

Trong phần này, chúng ta sẽ đi qua luồng dùng để đăng nhập người dùng bằng passkey.

![Tổng quan về đăng nhập người dùng bằng passkey.](passkeys-sign-in.svg)

Khi người dùng cố gắng đăng nhập, mã front-end của RP lại hỏi server về một giá trị [challenge](#challenges).

Tiếp theo, mã front-end của RP gọi {{domxref("CredentialsContainer.get()")}}. Nó có thể chỉ định nhiều tùy chọn, bao gồm:

- **Allowed credentials**: Một mảng các định danh cho các passkey mà RP sẽ chấp nhận. Mảng này có thể rỗng hoặc bị bỏ qua, trong trường hợp đó có thể dùng bất kỳ passkey phù hợp nào.

- **Challenge**: [Challenge](#challenges) do server của RP tạo ra.

- **Website ID**: ID của RP đang cố gắng đăng nhập người dùng. Xem [Passkey scope](#passkey_scope).

- **User verification**: Authenticator có nên thực hiện [xác minh người dùng](#user_verification) trước khi dùng passkey hay không.

Tiếp theo, trình duyệt tìm các passkey khớp với tiêu chí đã cho: nếu tìm thấy nhiều hơn một, nó có thể yêu cầu người dùng chọn một. Authenticator lưu passkey này thường sẽ yêu cầu người dùng cho phép sử dụng passkey đó, bao gồm [xác minh người dùng](#user_verification) nếu RP yêu cầu và authenticator hỗ trợ.

Sau đó authenticator sẽ dùng khóa riêng của passkey để tạo một [assertion](#assertions) được ký số, bao gồm challenge và các dữ liệu khác.

Mã front-end của RP gửi assertion lên server, server sẽ xác minh chữ ký bằng khóa công khai mà nó đã lưu. Nếu xác minh thành công, người dùng có thể được đăng nhập.

## Tính năng của WebAuthn

Trong phần này, chúng ta sẽ đi sâu hơn vào nhiều khía cạnh khác nhau của WebAuthn API.

### Authenticator nền tảng và roaming

WebAuthn API phân biệt hai loại authenticator:

- **Platform authenticator**
  - : Những authenticator này không thể tháo rời khỏi thiết bị. Ví dụ, authenticator được tích hợp trong hệ điều hành của thiết bị, như hệ thống [Touch ID](https://en.wikipedia.org/wiki/Touch_ID) trên thiết bị Apple hoặc hệ thống [Windows Hello](https://en.wikipedia.org/wiki/Windows_10#System_security).
- **Roaming authenticator**
  - : Những authenticator này có thể tháo khỏi thiết bị và gắn vào thiết bị khác. Ví dụ kinh điển là authenticator được triển khai trong một khóa USB, như [YubiKey](https://en.wikipedia.org/wiki/YubiKey).

Khi RP tạo một passkey mới, nó có thể chọn loại authenticator mình muốn dùng, như một phần của tùy chọn [`authenticatorSelection`](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#authenticatorselection) mà nó truyền vào {{domxref("CredentialsContainer.create()")}}.

Ưu điểm chính của platform authenticator là sự tiện lợi cho người dùng: họ không phải theo dõi một thiết bị phần cứng riêng. Nhược điểm chính là nó chỉ dùng được với thiết bị chủ của nó.

Platform authenticator đôi khi có thể hoạt động như roaming authenticator: ví dụ, một platform authenticator trên thiết bị di động có thể khả dụng cho máy tính xách tay như một roaming authenticator thông qua kết nối Bluetooth.

Mặc dù platform authenticator không thể tháo khỏi thiết bị của nó, chúng thường có thể chia sẻ passkey với các authenticator khác thông qua đồng bộ đám mây hoặc các chức năng nhập/xuất. Ví dụ, một nhà cung cấp nền tảng có thể cho phép người dùng chia sẻ passkey của họ trên tất cả thiết bị thuộc họ sản phẩm đó.

### Thông tin xác thực có thể phát hiện và không thể phát hiện

Đặc tả WebAuthn phân biệt giữa thông tin xác thực _có thể phát hiện_ và _không thể phát hiện_.

- **Thông tin xác thực có thể phát hiện**, còn được gọi là _resident key_, là những thứ có thể dùng mà RP không cần trước tiên xác định người dùng đang được xác thực: tức là mảng "allowed credentials" truyền vào {{domxref("CredentialsContainer.get()")}} có thể rỗng. Với một thông tin xác thực có thể phát hiện, toàn bộ vật liệu khóa ký được lưu trong authenticator, nên authenticator có thể tạo chữ ký mà không cần đầu vào nào từ RP.

- **Thông tin xác thực không thể phát hiện**, còn được gọi là _non-resident key_, là những thứ mà RP trước tiên phải xác định người dùng đang được xác thực (ví dụ, bằng cách yêu cầu họ nhập tên người dùng), rồi truyền ID của thông tin xác thực liên quan vào {{domxref("CredentialsContainer.get()")}}, trong mảng "allowed credentials".

  Thông tin xác thực không thể phát hiện cần ID của credential vì chúng không lưu chính khóa ký trong authenticator, mà thay vào đó tạo khóa ký mỗi khi cần, từ một seed nội bộ và giá trị ID của credential. Nói cách khác, khóa tài khoản không nằm thường trú trong authenticator.

Ưu điểm của việc dùng thông tin xác thực không thể phát hiện là một authenticator có dung lượng hạn chế vẫn có thể hỗ trợ số lượng tài khoản gần như không giới hạn, vì vật liệu khóa cho từng tài khoản không được lưu trong authenticator.

Ưu điểm của việc dùng thông tin xác thực có thể phát hiện là chúng cho phép trình duyệt triển khai [tự động điền](#autofill_ui) với thông tin xác thực khóa công khai, giúp người dùng đăng nhập dễ hơn rất nhiều, đặc biệt khi họ có cả thông tin xác thực khóa công khai lẫn mật khẩu cho cùng một site.

**Vì lý do này, passkey luôn phải là thông tin xác thực có thể phát hiện, nên các RP triển khai xác thực dựa trên passkey luôn nên làm cho chúng có thể phát hiện**.

Để tạo một thông tin xác thực có thể phát hiện, RP nên đặt tùy chọn `residentKey` thành `"required"` và tùy chọn `requireResidentKey` thành `true` khi nó tạo credential mới trong lời gọi {{domxref("CredentialsContainer.create()")}}.

### Challenge

Khi RP yêu cầu authenticator tạo passkey mới hoặc dùng passkey đã có, nó phải cung cấp một _challenge_. Đây là một giá trị ngẫu nhiên, dành riêng cho yêu cầu này, mà kẻ tấn công không thể đoán trước. Challenge phải được tạo trong một môi trường tin cậy (thường có nghĩa là trên server, không phải front end).

Mã front-end của RP truyền challenge vào lời gọi `create()` hoặc `get()`, và trình duyệt đưa cùng giá trị đó vào đối tượng được trả về bởi các phương thức này. Trong trường hợp `get()`, giá trị challenge cũng là một phần của đầu vào cho chữ ký số do authenticator tính.

Khi web server xác minh phản hồi từ authenticator, nó cần kiểm tra rằng challenge có cùng giá trị như giá trị ban đầu nó đã cung cấp.

Web server cũng nên vô hiệu hóa giá trị challenge sau khoảng 10 phút, và từ chối mọi phản hồi chứa challenge đến sau thời gian này.

Challenge là bằng chứng cho thấy phản hồi của authenticator là phản hồi cho _yêu cầu này_, chứ không phải phản hồi cũ từ một yêu cầu trước đó mà kẻ tấn công đã đánh cắp được. Loại tấn công này được gọi là {{glossary("replay attack")}}.

### Attestation

Bảo mật của passkey một phần phụ thuộc vào độ tin cậy của authenticator được dùng. Ví dụ, nếu một authenticator không bảo vệ các khóa riêng mà nó lưu, kẻ tấn công có thể đánh cắp khóa và mạo danh người dùng. WebAuthn định nghĩa một cơ chế tùy chọn gọi là _attestation_, trong đó authenticator có thể cung cấp bằng chứng có thể kiểm chứng cho RP về authenticator và dữ liệu nó tạo ra (như cặp khóa hoặc các assertion đã ký). Điều này có thể giúp RP quyết định có nên dựa vào authenticator đó để xác thực người dùng hay không.

Để triển khai attestation, authenticator chứa một cặp khóa gọi là _attestation key_, được tích hợp trong thiết bị từ thời điểm sản xuất, và được {{glossary("digital certificate", "chứng nhận")}} là thuộc về tổ chức đã tạo ra authenticator này. Ví dụ, chứng chỉ có thể nêu rằng authenticator này được sản xuất bởi "Acme Authenticator Incorporated".

Khi authenticator tạo passkey mới, nó ký đối tượng kết quả bằng attestation key của nó. RP xác minh chữ ký và chứng chỉ liên quan, và khi đó có bằng chứng rằng passkey được tạo bởi một authenticator do "Acme Authenticator Incorporated" sản xuất.

Không phải tất cả authenticator đều hỗ trợ attestation, và RP có thể cho biết rằng họ không quan tâm đến attestation. Trong các tình huống này, đối tượng trả về bởi lời gọi {{domxref("CredentialsContainer.create()")}} có thể hoàn toàn không được ký, hoặc có thể được ký bằng chính passkey đó (điều này được gọi là _self attestation_). Trong các tình huống này, RP không có bằng chứng đáng tin cậy về nguồn gốc hay khả năng của authenticator.

### Xác minh người dùng

Khi một website gọi {{domxref("CredentialsContainer.create()")}} để tạo passkey mới, hoặc gọi {{domxref("CredentialsContainer.get()")}} để tạo assertion, authenticator luôn yêu cầu người dùng đồng ý với thao tác.

RP cũng có thể yêu cầu authenticator thực hiện _xác minh người dùng_, nghĩa là người dùng sẽ được yêu cầu cho phép dùng credential của họ, ví dụ bằng cách nhập PIN hoặc một sinh trắc học như dấu vân tay.

Khi điều này xảy ra, nó được xem là một dạng {{glossary("multi-factor authentication")}}: chính authenticator là "thứ người dùng có" còn PIN hoặc sinh trắc học lần lượt là "thứ họ biết" hoặc "thứ họ là".

Lưu ý rằng không phải mọi authenticator đều hỗ trợ xác minh người dùng.

### Phạm vi của passkey

Phạm vi của một passkey quyết định những site nào được phép dùng passkey đó.

Mặc định:

- Khi một trang tạo passkey bằng cách gọi {{domxref("CredentialsContainer.create()")}}, trình duyệt đặt _RP ID_ của passkey thành thành phần domain của {{glossary("origin")}} của bên gọi, và authenticator lưu giá trị này cùng với passkey.

- Khi một trang dùng passkey bằng cách gọi {{domxref("CredentialsContainer.get()")}}, trình duyệt truyền thành phần domain của {{glossary("origin")}} của bên gọi đến authenticator, và authenticator chỉ cho phép dùng passkey nếu giá trị này khớp với RP ID đã lưu.

Điều này có nghĩa là theo mặc định, một passkey chỉ có thể được dùng bởi một trang có cùng origin (không tính port) với trang đã tạo ra nó.

Website được phép nới lỏng các quy tắc này, trong một số ràng buộc:

- Khi một website tạo passkey, nó có thể truyền một ID vào {{domxref("CredentialsContainer.create()")}}, và authenticator sẽ dùng ID đó làm RP ID.

- Tương tự, khi một website cố dùng passkey, nó có thể truyền một ID vào {{domxref("CredentialsContainer.get()")}}, và authenticator sẽ so sánh ID này với RP ID đã lưu.

Với cả `create()` và `get()`, giá trị được truyền vào phải là một {{glossary("registrable domain")}} là _domain suffix_ của domain thuộc origin của bên gọi.

Việc nới lỏng này có nghĩa là, chẳng hạn, một trang tại `https://register.example.com` có thể tạo passkey với RP ID là `example.com`, và sau đó một trang tại `https://login.example.com` sẽ được phép dùng passkey đó.

Phạm vi passkey giúp phòng chống các cuộc tấn công [phishing](/en-US/docs/Web/Security/Attacks/Phishing). Trong một cuộc tấn công phishing, người dùng được đưa tới một trang độc hại trông giống site mục tiêu, và trang này yêu cầu người dùng nhập thông tin xác thực cho site mục tiêu. Thông thường, URL của site độc hại trông giống URL của site mục tiêu, giúp đánh lừa người dùng. Ví dụ, nếu site mục tiêu là `https://example.com`, thì site phishing có thể được phục vụ từ `https://examp1e.com`.

Tuy nhiên, với các quy tắc phạm vi của passkey, một site được phục vụ từ `https://examp1e.com` không thể dùng passkey đã được tạo cho `https://example.com`.

### Xác minh origin

Assertion đã ký mà authenticator trả về bao gồm thông tin về ngữ cảnh của bên gọi:

- {{glossary("origin")}} của tài liệu đã gọi {{domxref("CredentialsContainer.get()")}}.
- Nếu bên gọi được nhúng dưới dạng một {{htmlelement("iframe")}}, thì bên gọi có cùng origin với tài liệu cấp cao nhất hay không.
- Origin của tài liệu cấp cao nhất, nếu bên gọi được nhúng dưới dạng một {{htmlelement("iframe")}} và không cùng origin với bên gọi.

Khi server của RP xác minh assertion, nó phải kiểm tra rằng các giá trị này đúng như nó kỳ vọng.

Điều này cung cấp một lớp bảo vệ chống lại các cuộc tấn công [phishing](/en-US/docs/Web/Security/Attacks/Phishing), ngoài lớp bảo vệ do [phạm vi passkey](#passkey_scope) mang lại.

## Các tính chất bảo mật của passkey

Passkey an toàn hơn mật khẩu, và chúng ta có thể thấy thiết kế của chúng giải quyết các [điểm yếu nghiêm trọng nhất của mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords#weaknesses_of_password-based_authentication) như thế nào:

- Không giống mật khẩu, người dùng không bao giờ phải tự nghĩ ra giá trị passkey hay ghi nhớ nó. Điều này có nghĩa là người dùng không thể chọn các giá trị passkey yếu, nên họ không dễ bị tấn công [đoán](/en-US/docs/Web/Security/Authentication/Passwords#guessing). Việc tạo passkey được chuyển từ người dùng sang authenticator.

- Passkey không bao giờ được dùng lại trên nhiều site, nên chúng không dễ bị tấn công [credential stuffing](/en-US/docs/Web/Security/Authentication/Passwords#credential_stuffing). Nếu kẻ tấn công có được passkey, chúng chỉ có thể dùng nó cho site đã tạo ra nó ban đầu.

- Với passkey, server không bao giờ phải lưu bất kỳ bí mật nào: nó chỉ lưu khóa công khai. Vì vậy nếu kẻ tấn công [đột nhập vào cơ sở dữ liệu của server](/en-US/docs/Web/Security/Authentication/Passwords#database_compromise), chúng không thể làm lộ khóa riêng, vì khóa riêng được lưu trong authenticator. Tuy nhiên, lưu ý rằng chúng vẫn có thể xâm phạm tài khoản người dùng nếu chúng có thể _ghi_ thông tin xác thực giả vào cơ sở dữ liệu của server.

- Khi người dùng cố đăng nhập, trình duyệt chỉ tìm passkey mà phạm vi khớp với site yêu cầu, và server của RP có thể xác minh rằng origin của bên yêu cầu đúng như mong đợi. Điều này làm passkey chống chịu tốt trước các cuộc tấn công [phishing](/en-US/docs/Web/Security/Attacks/Phishing), vì mã front-end được phục vụ từ một site phishing như `https://examp1e.com` không thể dùng passkey gắn với `https://example.com`.

Mặc dù passkey bảo vệ khỏi các cuộc tấn công xác thực web phổ biến này, chúng không loại bỏ mọi mối đe dọa. Vì việc triển khai passkey rộng rãi còn tương đối mới, hiện vẫn chưa có hiểu biết trưởng thành về các cuộc tấn công mà passkey có thể đối mặt, nhưng nhiều khả năng một số cuộc tấn công sẽ nhắm vào thiết bị của người dùng: ví dụ, thuyết phục họ cài một authenticator độc hại. Các cuộc tấn công cũng có thể nhắm vào những phần của hệ thống xác thực không được passkey bảo vệ, như cơ chế khôi phục tài khoản.

## Xử lý passkey bị mất

Nếu người dùng mất một authenticator, dù đó là mô-đun riêng hay được tích hợp trong điện thoại của họ, họ sẽ mất tất cả passkey nằm trong đó.

Trong phần này chúng ta sẽ bàn về hai chiến lược để xử lý việc mất authenticator:

- [Tạo nhiều passkey cho một tài khoản](#creating_multiple_passkeys)
- [Sao lưu passkey](#passkey_backup)

### Tạo nhiều passkey

Khác với lời khuyên dành cho mật khẩu, RP được khuyến khích tạo nhiều passkey cho một tài khoản. Một mô hình phổ biến sẽ có:

- Một passkey trong [platform authenticator](#platform_authenticators), là passkey dùng hằng ngày cho site
- Một passkey trong [roaming authenticator](#roaming_authenticators), mà người dùng giữ ở nơi an toàn, như bản sao lưu trong trường hợp họ mất thiết bị.

Tùy chọn [`excludeCredentials`](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#excludecredentials), được truyền vào {{domxref("CredentialsContainer.create()")}}, liệt kê các ID credential, và báo cho trình duyệt rằng các authenticator chứa những khóa đã liệt kê không được dùng để tạo khóa mới. Nói cách khác, đây là cách để RP bảo đảm passkey mới được tạo trong một authenticator mới.

### Sao lưu passkey

Một số authenticator hỗ trợ sao lưu bằng nhiều phương thức, như đồng bộ đám mây hoặc xuất thủ công. Assertion đã ký trả về từ lời gọi `get()` bao gồm một tập hợp [cờ](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data#flags), mà trong số những điều khác, cho biết passkey:

- Có _đủ điều kiện để sao lưu_ hay không: tức là nó có được lưu trong authenticator hỗ trợ sao lưu hay không
- Trên thực tế đã được sao lưu hay chưa.

RP có thể dùng thông tin này để giúp người dùng quản lý credential của họ. Ví dụ:

- Nếu passkey không đủ điều kiện để sao lưu, RP có thể phản hồi bằng cách mời người dùng tạo một passkey khác trong một authenticator khác có thể dùng làm bản sao lưu.

- Nếu RP đang chuyển người dùng khỏi mật khẩu, và người dùng có cả mật khẩu cũ lẫn passkey, và assertion cho biết passkey đã được sao lưu, thì RP có thể mời người dùng xóa mật khẩu cũ, vì họ không còn cần nó làm bản sao lưu nữa.

## Quản lý passkey

Chúng ta đã thấy rằng một người dùng có thể có nhiều passkey cho một tài khoản, phân bố trên nhiều authenticator và nhiều thiết bị. Mỗi passkey tương ứng với một credential WebAuthn, với vật liệu khóa riêng được authenticator bảo vệ và khóa công khai tương ứng được RP lưu như một phần thông tin tài khoản của người dùng.

Đôi khi người dùng có thể cần xóa một passkey khỏi tài khoản RP của họ: thực chất điều này có nghĩa là xóa khóa công khai được lưu trên server của RP, để khóa riêng tương ứng không thể dùng để đăng nhập người dùng nữa. Việc này thường cần khi người dùng không còn kiểm soát authenticator nữa, ví dụ vì họ đã mất thiết bị chứa nó.

Điều này có nghĩa là RP nên triển khai một cách để người dùng đã xác thực có thể xem các passkey đã đăng ký cho tài khoản của họ và xóa các khóa công khai cụ thể. Với mỗi khóa, RP nên hiển thị thông tin giúp người dùng hiểu đó là khóa nào và nó gắn với authenticator nào. Điều này có thể bao gồm:

- **Tên nhà cung cấp passkey**: Tên của nhà cung cấp passkey, như "Windows Hello" hoặc "Bitwarden".

  > [!NOTE]
  > Để xác định giá trị này:
  >
  > - Tìm giá trị _AAGUID_ trong [`attestedCredentialData`](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data#attestedcredentialdata) được trình duyệt trả về sau một lời gọi {{domxref("CredentialsContainer.create()")}} thành công.
  > - Dùng giá trị này để tra cứu tên tương ứng trong danh sách [Passkey Provider AAGUIDs](https://github.com/passkeydeveloper/passkey-authenticator-aaguids).
  >
  > Xem thêm [Determine the passkey provider with AAGUID](https://web.dev/articles/webauthn-aaguid).

- **Timestamp**: Thời điểm passkey được dùng lần cuối để đăng nhập.

- **Trạng thái sao lưu**: Chỉ báo passkey đã được sao lưu hay chưa (xem [Passkey backup](#passkey_backup)).

Ngoài ra, người dùng nên có thể chỉnh sửa tên passkey và xóa passkey.

Nếu người dùng cố xóa passkey cuối cùng, RP nên thông báo cho họ về hệ quả của việc này: RP có thể cho phép người dùng đăng nhập bằng một phương thức khác như [mã dùng một lần](/en-US/docs/Web/Security/Authentication/OTP), hoặc họ có thể không còn truy cập được tài khoản nữa.

Xem thêm [Help users manage passkeys effectively](https://web.dev/articles/passkey-management).

### Đồng bộ server và authenticator

Lưu ý rằng nếu người dùng xóa một passkey trên server của RP, điều này tạo ra sự bất đối xứng giữa server và authenticator đang chứa khóa riêng tương ứng. Authenticator vẫn nghĩ passkey đó hợp lệ, nên trình duyệt có thể đề xuất nó cho người dùng như một tùy chọn đăng nhập, nhưng RP sẽ không còn chấp nhận assertion của nó nữa.

Để giảm khả năng phát sinh vấn đề như vậy, WebAuthn API định nghĩa một tập hợp phương thức tĩnh của {{domxref("PublicKeyCredential")}} cho phép RP báo cho authenticator về các thay đổi phía server:

- {{domxref("PublicKeyCredential.signalUnknownCredential_static", "PublicKeyCredential.signalUnknownCredential()")}} báo cho trình duyệt rằng một passkey cụ thể không được RP nhận ra, và thường được gọi ngay sau khi người dùng cố đăng nhập bằng passkey này. Tình huống phổ biến nhất là người dùng đã xóa passkey này trên server, rồi vô tình cố đăng nhập bằng nó.

- {{domxref("PublicKeyCredential.signalAllAcceptedCredentials_static", "PublicKeyCredential.signalAllAcceptedCredentials()")}} cung cấp cho trình duyệt định danh của tất cả passkey mà RP hiện chấp nhận là hợp lệ, để cho tất cả authenticator gắn với nó cập nhật các khóa đã lưu. Nó có thể được gọi mỗi khi người dùng xác thực thành công. API này chỉ được gọi cho người dùng đã xác thực, vì nó làm lộ ID credential của người dùng.

- {{domxref("PublicKeyCredential.signalCurrentUserDetails_static", "PublicKeyCredential.signalCurrentUserDetails()")}} báo cho trình duyệt biết tên người dùng và tên hiển thị hiện tại của người dùng, và nên được gọi khi người dùng đã xác thực thay đổi các giá trị này. API này chỉ được gọi cho người dùng đã xác thực, vì nó làm lộ dữ liệu người dùng.

## Chuyển từ mật khẩu

Hầu hết website thêm hỗ trợ passkey sẽ đã hỗ trợ xác thực bằng mật khẩu, và sẽ có sẵn một lượng người dùng có mật khẩu. Những người dùng này vẫn không an toàn trước [các điểm yếu của mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords#weaknesses_of_password-based_authentication) cho đến khi họ không chỉ có và dùng passkey trên site của bạn, mà thậm chí không còn sở hữu mật khẩu gắn với tài khoản của họ nữa.

Bạn có thể triển khai quy trình ba bước để chuyển người dùng khỏi mật khẩu:

- [Cho phép người dùng tạo passkey song song với mật khẩu](#creating_passkeys_alongside_passwords)
- [Cho phép người dùng dùng passkey thay cho mật khẩu](#using_passkeys_alongside_passwords)
- [Cho phép người dùng xóa mật khẩu](#retiring_passwords)

### Tạo passkey cùng với mật khẩu

Bước đầu tiên ở đây là cho người dùng cơ hội tạo passkey khi họ đăng nhập thành công vào site của bạn bằng mật khẩu.

#### Conditional create

Một bước bổ sung để tăng mức độ chấp nhận passkey là tính năng gọi là _conditional create_. Tính năng này cho phép RP tạo passkey mới cho tài khoản của người dùng mà không yêu cầu bất kỳ tương tác nào từ người dùng, khi một số điều kiện nhất định được đáp ứng.

Để bật conditional create, RP gọi {{domxref("CredentialsContainer.create()")}}, truyền tùy chọn [`mediation`](/en-US/docs/Web/API/CredentialsContainer/create#mediation) được đặt thành `"conditional"`:

```js
try {
  const publicKeyCredential = await navigator.credentials.create({
    publicKey: options,
    mediation: "conditional",
  });
  // xử lý việc tạo passkey mới
  // cho người dùng biết rằng họ đã có passkey
} catch (e) {
  // passkey không được tạo
}
```

Với tùy chọn này:

- Nếu người dùng vừa đăng nhập bằng mật khẩu, sử dụng một password manager cũng hỗ trợ passkey (tức là một _credentials manager_ cũng có thể hoạt động như authenticator), thì trình duyệt sẽ yêu cầu credentials manager đó tạo một passkey mới cho người dùng mà không hỏi người dùng.

- Nếu không, lời gọi `create()` sẽ thất bại.

Từ góc nhìn của người dùng, nếu việc tạo thất bại, họ không biết là nó đã được thử, và nếu thành công, RP có thể thông báo rằng họ đã có một passkey để dùng đăng nhập lần sau.

Ý tưởng ở đây là nếu người dùng vốn đã dựa vào credentials manager để đăng nhập, thì họ ngầm tin cậy nó quản lý thông tin xác thực đăng nhập của mình _nói chung_, nên họ cũng có thể tin nó tạo thêm một dạng thông tin xác thực mới cho họ.

### Dùng passkey song song với mật khẩu

Nếu một người dùng có cả mật khẩu và một hoặc nhiều passkey, họ có thể chọn dùng một trong hai để đăng nhập, và RP có thể muốn khuyến khích họ dùng passkey.

Trong giai đoạn chuyển tiếp, một người dùng có thể có hoặc mật khẩu hoặc passkey cho tài khoản của họ, hoặc cả hai. Trong tình huống này, một giao diện hỏi họ muốn đăng nhập bằng phương thức nào có thể gây nhầm lẫn: họ có thể không nhớ mình có phương thức nào cho tài khoản nào.

#### Giao diện tự động điền

Một kỹ thuật để giúp người dùng trong tình huống này là _giao diện tự động điền_, đôi khi còn được gọi là _conditional mediation_.

Trong kỹ thuật này, trang đăng nhập của RP cung cấp cho người dùng một form, cho phép họ đăng nhập bằng tên người dùng và mật khẩu. Trong trường tên người dùng, RP thêm giá trị autocomplete là `"webauthn"`:

```html
<input type="text" name="username" autocomplete="username webauthn" autofocus />
```

Ở nền, RP bắt đầu quy trình bình thường để yêu cầu một assertion được ký bằng passkey: nó lấy một [challenge](#challenges) từ server và chuẩn bị các tùy chọn khác cho {{domxref("CredentialsContainer.get()")}}.

Tuy nhiên, khi RP gọi `get()`, nó truyền tùy chọn `mediation: "conditional"` (giống như với [conditional create](#conditional_create)):

```js
const assertion = await navigator.credentials.get({
  publicKey: options,
  mediation: "conditional",
});
```

Tác dụng của điều này là lời gọi sẽ chờ cho đến khi người dùng tương tác với trường tên người dùng. Khi người dùng tương tác với trường này, trình duyệt tìm các passkey có thể dùng để đăng nhập vào RP, và hiển thị chúng cho người dùng như các giá trị tự động điền. Nếu người dùng chọn một passkey, passkey được chọn sẽ được dùng, và RP có thể dùng assertion thu được để đăng nhập người dùng.

Nếu người dùng không có passkey cho site, hoặc họ không chọn một passkey nào được đề xuất, thì họ có thể nhập tên người dùng và mật khẩu, hoặc để password manager tự động điền.

Điều này có nghĩa là bạn có thể hỗ trợ người dùng có thể có mật khẩu hoặc passkey, hoặc cả hai, mà không cần giao diện đặc biệt nào, và không cần người dùng phải nhớ liệu họ thật sự có passkey cho site của bạn hay không.

### Loại bỏ mật khẩu

Ngay cả khi một người dùng có passkey cho site của bạn, và dùng nó thay vì mật khẩu, họ vẫn dễ bị các cuộc tấn công như [credential stuffing](/en-US/docs/Web/Security/Authentication/Passwords#credential_stuffing), [guessing](/en-US/docs/Web/Security/Authentication/Passwords#guessing), và [phishing](/en-US/docs/Web/Security/Attacks/Phishing) miễn là bạn còn giữ mật khẩu cho tài khoản của họ.

Vì vậy, như một bước cuối cùng, bạn có thể muốn cho người dùng xóa hoàn toàn mật khẩu của họ. Bạn có thể cung cấp tùy chọn này trong phần cài đặt tài khoản của họ, và có thể nhắc họ xóa mật khẩu nếu họ không dùng nó trong thời gian dài (nhưng vẫn dùng passkey đều đặn).

Tuy nhiên, bạn cũng nên cân nhắc rằng việc có mật khẩu giúp bảo vệ người dùng khỏi bị khóa tài khoản nếu họ mất quyền truy cập passkey. Trước khi khuyến khích người dùng xóa mật khẩu, bạn có thể kiểm tra xem họ có bảo vệ thay thế hay không, chẳng hạn [nhiều passkey trên các authenticator khác nhau](#creating_multiple_passkeys), và/hoặc passkey đã được [sao lưu](#passkey_backup).

## Xem thêm

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- [Passkey Central](https://www.passkeycentral.org/home)
- [passkeys.dev](https://passkeys.dev/)
- [Passkeys](https://developers.google.com/identity/passkeys/) (developers.google.com)
