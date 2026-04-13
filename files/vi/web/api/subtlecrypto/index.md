---
title: SubtleCrypto
slug: Web/API/SubtleCrypto
page-type: web-api-interface
browser-compat: api.SubtleCrypto
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Giao diện **`SubtleCrypto`** của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) cung cấp một số hàm mật mã cấp thấp.

Tên giao diện bao gồm thuật ngữ "subtle" (tinh tế) để chỉ ra rằng nhiều thuật toán của nó có các yêu cầu sử dụng tinh tế, và do đó phải được sử dụng cẩn thận để cung cấp các đảm bảo bảo mật phù hợp.

Một thực thể của `SubtleCrypto` có sẵn dưới dạng thuộc tính {{domxref("Crypto.subtle", "subtle")}} của giao diện {{domxref("Crypto")}}, giao diện này có sẵn trong cửa sổ thông qua thuộc tính {{domxref("Window.crypto")}} và trong worker thông qua thuộc tính {{domxref("WorkerGlobalScope.crypto")}}.

> [!WARNING]
> API này cung cấp một số nguyên thủy mật mã cấp thấp. Rất dễ lạm dụng chúng và những cạm bẫy liên quan có thể rất tinh tế.
>
> Ngay cả khi bạn sử dụng đúng các hàm mật mã cơ bản, việc quản lý khóa bảo mật và thiết kế hệ thống bảo mật tổng thể là cực kỳ khó thực hiện đúng, và thường là lĩnh vực của các chuyên gia bảo mật.
>
> Lỗi trong thiết kế và triển khai hệ thống bảo mật có thể làm cho hệ thống bảo mật trở nên hoàn toàn vô hiệu.
>
> Vui lòng học hỏi và thử nghiệm, nhưng đừng đảm bảo hoặc ngụ ý về tính bảo mật của công việc trước khi một người có kiến thức chuyên môn về lĩnh vực này xem xét kỹ lưỡng. [Crypto 101 Course](https://www.crypto101.io/) có thể là nơi tuyệt vời để bắt đầu học về thiết kế và triển khai các hệ thống bảo mật.

## Thuộc tính thực thể

_Giao diện này không kế thừa bất kỳ thuộc tính nào vì nó không có giao diện cha._

## Phương thức thực thể

_Giao diện này không kế thừa bất kỳ phương thức nào vì nó không có giao diện cha._

- {{domxref("SubtleCrypto.encrypt()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với dữ liệu đã mã hóa tương ứng với văn bản gốc, thuật toán và khóa được truyền làm tham số.
- {{domxref("SubtleCrypto.decrypt()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với dữ liệu gốc tương ứng với văn bản đã mã hóa, thuật toán và khóa được truyền làm tham số.
- {{domxref("SubtleCrypto.sign()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với chữ ký số tương ứng với văn bản, thuật toán và khóa được truyền làm tham số.
- {{domxref("SubtleCrypto.verify()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với giá trị boolean cho biết chữ ký được truyền làm tham số có khớp với văn bản, thuật toán và khóa cũng được truyền làm tham số hay không.
- {{domxref("SubtleCrypto.digest()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với giá trị digest được tạo từ thuật toán và văn bản được truyền làm tham số.
- {{domxref("SubtleCrypto.generateKey()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với một {{domxref("CryptoKey")}} mới được tạo (cho thuật toán đối xứng) hoặc một {{domxref("CryptoKeyPair")}} chứa hai khóa mới được tạo (cho thuật toán bất đối xứng). Những khóa này sẽ khớp với thuật toán, cách sử dụng và khả năng trích xuất được truyền làm tham số.
- {{domxref("SubtleCrypto.deriveKey()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với một {{domxref("CryptoKey")}} mới được tạo từ khóa chính và thuật toán cụ thể được truyền làm tham số.
- {{domxref("SubtleCrypto.deriveBits()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với một bộ đệm bit giả ngẫu nhiên mới được tạo từ khóa chính và thuật toán cụ thể được truyền làm tham số.
- {{domxref("SubtleCrypto.importKey()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với một {{domxref("CryptoKey")}} tương ứng với định dạng, thuật toán, dữ liệu khóa thô, cách sử dụng và khả năng trích xuất được truyền làm tham số.
- {{domxref("SubtleCrypto.exportKey()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với dữ liệu khóa thô chứa khóa ở định dạng được yêu cầu.
- {{domxref("SubtleCrypto.wrapKey()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với một khóa đối xứng đã được bọc để sử dụng (truyền và lưu trữ) trong môi trường không bảo mật. Khóa đã bọc khớp với định dạng được chỉ định trong các tham số đã cho, và việc bọc được thực hiện bằng khóa bọc đã cho, sử dụng thuật toán được chỉ định.
- {{domxref("SubtleCrypto.unwrapKey()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfill với một {{domxref("CryptoKey")}} tương ứng với khóa đã bọc được truyền trong tham số.

## Sử dụng SubtleCrypto

Chúng ta có thể chia các hàm được triển khai bởi API này thành hai nhóm: các hàm mật mã và các hàm quản lý khóa.

### Các hàm mật mã

Đây là các hàm bạn có thể sử dụng để triển khai các tính năng bảo mật như quyền riêng tư và xác thực trong hệ thống. API `SubtleCrypto` cung cấp các hàm mật mã sau:

- {{DOMxRef("SubtleCrypto.sign","sign()")}} và {{DOMxRef("SubtleCrypto.verify","verify()")}}: tạo và xác minh chữ ký số.
- {{DOMxRef("SubtleCrypto.encrypt","encrypt()")}} và {{DOMxRef("SubtleCrypto.decrypt","decrypt()")}}: mã hóa và giải mã dữ liệu.
- {{DOMxRef("SubtleCrypto.digest","digest()")}}: tạo giá trị digest có độ dài cố định, chống va chạm từ một số dữ liệu.

### Các hàm quản lý khóa

Ngoại trừ {{DOMxRef("SubtleCrypto.digest","digest()")}}, tất cả các hàm mật mã trong API đều sử dụng khóa mật mã. Trong API `SubtleCrypto`, một khóa mật mã được biểu diễn bằng đối tượng {{DOMxRef("CryptoKey")}}. Để thực hiện các thao tác như ký và mã hóa, bạn truyền đối tượng {{DOMxRef("CryptoKey")}} vào hàm {{DOMxRef("SubtleCrypto.sign","sign()")}} hoặc {{DOMxRef("SubtleCrypto.encrypt","encrypt()")}}.

#### Tạo và phái sinh khóa

Cả hai hàm {{DOMxRef("SubtleCrypto.generateKey","generateKey()")}} và {{DOMxRef("SubtleCrypto.deriveKey","deriveKey()")}} đều tạo đối tượng {{DOMxRef("CryptoKey")}} mới.

Sự khác biệt là `generateKey()` sẽ tạo ra một giá trị khóa riêng biệt mới mỗi khi bạn gọi nó, trong khi `deriveKey()` phái sinh một khóa từ một số tài liệu khóa ban đầu. Nếu bạn cung cấp cùng tài liệu khóa cho hai lệnh gọi riêng biệt đến `deriveKey()`, bạn sẽ nhận được hai đối tượng `CryptoKey` có cùng giá trị cơ bản. Điều này hữu ích nếu, ví dụ, bạn muốn phái sinh một khóa mã hóa từ mật khẩu và sau đó phái sinh cùng khóa đó từ cùng mật khẩu để giải mã dữ liệu.

#### Nhập và xuất khóa

Để làm cho khóa khả dụng bên ngoài ứng dụng của bạn, bạn cần xuất khóa, và đó là mục đích của {{DOMxRef("SubtleCrypto.exportKey","exportKey()")}}. Bạn có thể chọn một trong số định dạng xuất.

Ngược lại với `exportKey()` là {{DOMxRef("SubtleCrypto.importKey","importKey()")}}. Bạn có thể nhập khóa từ các hệ thống khác, và hỗ trợ cho các định dạng chuẩn như [PKCS #8](https://datatracker.ietf.org/doc/html/rfc5208) và [JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517) giúp bạn thực hiện điều này. Hàm `exportKey()` xuất khóa ở định dạng không mã hóa.

Nếu khóa nhạy cảm, bạn nên sử dụng {{DOMxRef("SubtleCrypto.wrapKey","wrapKey()")}}, hàm này xuất khóa rồi mã hóa nó bằng một khóa khác; API gọi là "khóa bọc khóa".

Ngược lại với `wrapKey()` là {{DOMxRef("SubtleCrypto.unwrapKey","unwrapKey()")}}, hàm này giải mã rồi nhập khóa.

#### Lưu trữ khóa

`CryptoKey` là một {{glossary("serializable object")}}, cho phép lưu trữ và truy xuất khóa bằng các API lưu trữ web chuẩn.

Đặc tả kỹ thuật dự kiến rằng hầu hết các nhà phát triển sẽ sử dụng [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API), lưu trữ các đối tượng `CryptoKey` theo một số định danh chuỗi khóa có ý nghĩa đối với ứng dụng, cùng với bất kỳ siêu dữ liệu nào khác mà ứng dụng thấy hữu ích.
Điều này cho phép lưu trữ và truy xuất `CryptoKey` mà không cần phải exposing giá trị khóa cơ bản của nó cho ứng dụng hoặc môi trường JavaScript.

### Các thuật toán được hỗ trợ

Các hàm mật mã được cung cấp bởi Web Crypto API có thể được thực hiện bởi một hoặc nhiều _thuật toán mật mã_ khác nhau: đối số `algorithm` truyền cho hàm cho biết thuật toán nào sẽ sử dụng. Một số thuật toán cần thêm tham số: trong những trường hợp này, đối số `algorithm` là một đối tượng từ điển bao gồm các tham số bổ sung.

Bảng dưới đây tóm tắt những thuật toán nào phù hợp cho những thao tác mật mã nào:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row"></th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/sign">sign</a><br /><a href="/en-US/docs/Web/API/SubtleCrypto/verify">verify</a>
      </th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/encrypt">encrypt</a><br /><a href="/en-US/docs/Web/API/SubtleCrypto/decrypt">decrypt</a>
      </th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/digest">digest</a>
      </th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/deriveBits">deriveBits</a><br /><a href="/en-US/docs/Web/API/SubtleCrypto/deriveKey">deriveKey</a>
      </th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/wrapKey">wrapKey</a><br /><a href="/en-US/docs/Web/API/SubtleCrypto/unwrapKey">unwrapKey</a>
      </th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/generateKey">generateKey</a><br /><a href="/en-US/docs/Web/API/SubtleCrypto/exportKey">exportKey</a>
      </th>
      <th scope="col">
        <a href="/en-US/docs/Web/API/SubtleCrypto/importKey">importKey</a>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/sign#rsassa-pkcs1-v1_5">RSASSA-PKCS1-v1_5</a></th>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/sign#rsa-pss">RSA-PSS</a></th>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/sign#ecdsa">ECDSA</a></th>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/sign#ed25519">Ed25519</a></th>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/sign#hmac">HMAC</a></th>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/encrypt#rsa-oaep">RSA-OAEP</a></th>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-ctr">AES-CTR</a></th>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-cbc">AES-CBC</a></th>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/encrypt#aes-gcm">AES-GCM</a></th>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/wrapKey#aes-kw">AES-KW</a></th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms">SHA-1</a></th>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms">SHA-256</a></th>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms">SHA-384</a></th>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/digest#supported_algorithms">SHA-512</a></th>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/deriveKey#ecdh">ECDH</a></th>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/deriveKey#x25519">X25519</a></th>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/deriveKey#hkdf">HKDF</a></th>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td>✓</td>
    </tr>
    <tr>
      <th scope="row"><a href="/en-US/docs/Web/API/SubtleCrypto/deriveKey#pbkdf2">PBKDF2</a></th>
      <td></td>
      <td></td>
      <td></td>
      <td>✓</td>
      <td></td>
      <td></td>
      <td>✓</td>
    </tr>
  </tbody>
</table>

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- [Các công dụng phi mật mã của SubtleCrypto](/en-US/docs/Web/API/Web_Crypto_API/Non-cryptographic_uses_of_subtle_crypto)
- [Bảo mật web](/en-US/docs/Web/Security)
- [Quyền riêng tư, quyền và bảo mật thông tin](/en-US/docs/Web/Privacy)
- {{domxref("Crypto")}} và {{domxref("Crypto.subtle")}}.
- [Crypto 101](https://www.crypto101.io/): khóa học giới thiệu về mật mã.
