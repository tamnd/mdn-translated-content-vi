---
title: Tấn công chuỗi cung ứng
slug: Web/Security/Attacks/Supply_chain_attacks
page-type: guide
sidebar: security
---

Một _chuỗi cung ứng phần mềm_ bao gồm toàn bộ phần mềm và công cụ được dùng để tạo ra và duy trì một sản phẩm phần mềm. Điều này không chỉ bao gồm phần mềm được phát triển cho chính sản phẩm đó mà còn toàn bộ phần mềm và công cụ được dùng trong quá trình sản xuất nó.

Trong một cuộc tấn công chuỗi cung ứng, kẻ tấn công nhắm vào một phần của chuỗi cung ứng của sản phẩm nhằm xâm phạm chính sản phẩm đó.

Ví dụ rõ ràng nhất ở đây là một thư viện của bên thứ ba. Nếu bạn dùng, chẳng hạn, một gói [npm](https://www.npmjs.com/) do bên thứ ba phát triển, nó có khả năng xâm phạm site của bạn. Nó có thể làm vậy một cách cố ý, nếu nó độc hại, hoặc vô tình, nếu bản thân nó chứa các lỗ hổng không chủ ý. Về cơ bản, bạn phải tin tưởng các phụ thuộc bên thứ ba của mình gần như mức bạn tin tưởng mã của chính bạn.

Ít rõ ràng hơn, cùng nguyên tắc đó áp dụng cho tất cả các công cụ bạn dùng khi tạo phần mềm, bao gồm trình soạn thảo mã, plugin của trình soạn thảo, hệ thống quản lý phiên bản, công cụ build, v.v. Bất kỳ công cụ nào trong số này cũng có thể chèn mã độc hoặc mã dễ bị tấn công vào sản phẩm phần mềm cuối cùng của bạn, trong quá trình các phép biến đổi mà chúng áp dụng.

Trong tài liệu này, chúng ta sẽ phác thảo các thực hành cần theo để bảo vệ chuỗi cung ứng phần mềm của bạn. Tài liệu được tổ chức thành hai phần chính:

- [Bảo vệ môi trường phát triển của bạn](#securing_your_development_environment): các thực hành giúp bảo đảm mã của chính bạn không bị xâm phạm.
- [Quản lý các phụ thuộc bên thứ ba](#managing-third-party-dependencies): các thực hành giúp bảo đảm các phụ thuộc của bạn không bị xâm phạm.

## Bảo vệ môi trường phát triển của bạn

Một con đường cho tấn công chuỗi cung ứng là kẻ tấn công đưa lỗ hổng hoặc mã độc trực tiếp vào chính sản phẩm của bạn. Trong phần này, chúng ta sẽ mô tả một số thực hành có thể chống lại mối đe dọa này.

### Triển khai kiểm soát truy cập

Triển khai kiểm soát truy cập mạnh cho mọi người làm việc trên dự án, bao gồm bất kỳ ai có quyền ghi vào kho mã nguồn của bạn hoặc có quyền sửa đổi cấu hình build hay kiểm thử. Các thực hành tốt ở đây gồm:

- Yêu cầu {{glossary("multi-factor authentication")}} cho các thành viên nhóm.
- Tuân theo {{glossary("principle of least privilege")}}: tức là chỉ cấp đặc quyền cho những thành viên thực sự cần chúng, và chủ động giảm thiểu số thành viên được cấp các quyền rất mạnh.

### Bảo vệ công cụ

Đánh giá rủi ro bảo mật của bất kỳ công cụ nào bạn dùng trong quá trình sản xuất site, bao gồm:

- Trình soạn thảo văn bản và IDE
- Plugin của trình soạn thảo
- Hệ thống quản lý mã nguồn
- Tất cả công cụ tham gia vào quá trình build, test, và triển khai

Với các phụ thuộc phần mềm nguồn mở, bạn có thể dùng [Concise Guide for Evaluating Open Source Software](https://best.openssf.org/Concise-Guide-for-Evaluating-Open-Source-Software), do [OpenSSF](https://openssf.org/) xuất bản, như một hướng dẫn.

### Bảo vệ cấu hình của bạn

Hiểu và áp dụng các thiết lập an toàn cho công cụ của bạn, đặc biệt là hệ thống quản lý mã nguồn. Các bảo vệ chính là:

- Bảo đảm các pull request (PR) phải qua review và được chủ mã phê duyệt rõ ràng trước khi được merge.
- Bảo đảm PR phải vượt qua các kiểm tra {{glossary("continuous integration")}} trước khi được merge.
- Yêu cầu các commit phải được ký.

Xem [Source Code Management Platform Configuration Best Practices](https://best.openssf.org/SCM-BestPractices/) của OpenSSF, trong đó có các checklist cụ thể cho GitHub và GitLab.

## Quản lý các phụ thuộc bên thứ ba

Các phụ thuộc bên thứ ba không chỉ gồm thư viện và framework mà mã của bạn dùng, mà còn tất cả công cụ bên thứ ba tham gia vào quá trình phát triển, bao gồm trình soạn thảo, IDE, hệ thống quản lý mã nguồn, trình quản lý gói, và công cụ build.

Để giảm thiểu vấn đề với các phụ thuộc bên thứ ba, chúng ta sẽ thảo luận bốn thực hành:

1. Đánh giá các phụ thuộc mới
2. Cập nhật các phụ thuộc hiện có
3. Duy trì _Software Bill of Materials_ (SBOM)
4. Dùng Subresource Integrity cho các script bên ngoài

### Đánh giá các phụ thuộc mới

Trước khi thêm một phụ thuộc mới, bạn nên đánh giá mức độ rủi ro bảo mật mà nó mang lại. Bạn cần tin tưởng rằng phụ thuộc đó được duy trì tích cực, rằng nó có lịch sử sửa lỗi và có quy trình để báo cáo cũng như phản hồi các lỗ hổng bảo mật.

Bạn nên cân nhắc liệu rủi ro khi thêm phụ thuộc đó có lớn hơn chi phí tự triển khai tính năng đó hay không.

[Concise Guide for Evaluating Open Source Software](https://best.openssf.org/Concise-Guide-for-Evaluating-Open-Source-Software), do [OpenSSF](https://openssf.org/) xuất bản, liệt kê các câu hỏi bạn nên tự hỏi trước khi thêm một phụ thuộc mới.

### Cập nhật các phụ thuộc

Khi bạn đã thêm một phụ thuộc vào dự án, nhà cung cấp phụ thuộc đó thường sẽ phát hành các phiên bản mới với tính năng mới, sửa lỗi, và vá bảo mật. Thông thường bạn sẽ muốn tận dụng các cập nhật này bằng cách triển khai một cơ chế để giữ cho phụ thuộc luôn được cập nhật. Các công cụ như [dependabot](https://docs.github.com/en/code-security/tutorials/secure-your-dependencies/dependabot-quickstart-guide) của GitHub có thể giúp việc này, bằng cách phát hiện các phiên bản mới của phụ thuộc và tự động mở pull request để cập nhật dự án của bạn.

Tuy nhiên, cập nhật phụ thuộc quá vội vàng cũng có những rủi ro riêng. Ví dụ, giả sử bạn thêm một phụ thuộc vào một gói bên thứ ba đáng tin cậy. Sau đó kẻ tấn công chiếm được tài khoản của nhà phát triển gói đó, và phát hành một bản cập nhật độc hại. Nếu bạn chấp nhận ngay bản cập nhật đó, dự án của bạn sẽ bị xâm phạm.

#### Dùng lockfile

Bước đầu tiên để bảo vệ việc cập nhật phụ thuộc là dùng _lockfile_ cho các phụ thuộc, commit nó vào hệ thống quản lý mã nguồn, và dùng nó khi build dự án của bạn.

Các trình quản lý gói như [npm](https://www.npmjs.com/) và [Yarn](https://yarnpkg.com/) cho phép bạn cung cấp một tệp như [package.json](https://docs.npmjs.com/cli/configuring-npm/package-json/) liệt kê các phụ thuộc của dự án. Sau đó bạn có thể chạy một lệnh cài đặt các phụ thuộc đã cho để dự án có thể dùng chúng.

Tuy nhiên, danh sách phụ thuộc không xác định phiên bản chính xác của từng gói: nếu nhà cung cấp gói phát hành một phiên bản mới, nó có thể tự động được đưa vào dự án của bạn khi được build. Nếu phiên bản mới của phụ thuộc là độc hại, nó có thể được đưa vào dự án của bạn tự động, mà bạn thậm chí không biết.

Ví dụ, giả sử package.json của bạn có một phụ thuộc tên là "example-dependency":

```json
{
  "name": "example-project",
  "version": "1.0.0",
  "dependencies": {
    "example-dependency": "^1.0.2"
  }
}
```

Giả sử quá trình build của dự án bạn tự động chạy khi nhà cung cấp phát hành phiên bản mới. Quá trình build bắt đầu bằng cách gọi `npm install`. Việc này sẽ lấy phiên bản mới nhất của "example-dependency", trong phạm vi phiên bản `"^1.0.2"`.

Ở phiên bản `1.0.2`, là lúc bạn thêm nó vào dự án, "example-dependency" là một gói hữu ích và lành tính. Sau đó kẻ tấn công chiếm được tài khoản của nhà phát triển "example-dependency", và phát hành một phiên bản `1.0.3` độc hại. Quá trình build của bạn chạy, cài gói độc hại đó, và bạn bị xâm phạm.

Tất cả điều này xảy ra mà không có bất kỳ thay đổi nào đối với các artifact trực tiếp của dự án, và không có cơ hội để bạn review bản cập nhật và xem liệu nó có đáng ngờ hay không.

Giải pháp cho việc này là dùng lockfile khi build dự án. Lockfile được tạo tự động mỗi khi phụ thuộc của một dự án được cài, và nó liệt kê các phiên bản chính xác của các phụ thuộc trực tiếp và gián tiếp được dùng trong dự án.

Nghĩa là, nếu _package.json_ cho bạn biết dự án đang dùng "example-dependency", thì _package.lock_ sẽ cho bạn biết chính xác phiên bản nào của "example-dependency" cần dùng, và các phiên bản phụ thuộc của nó là gì.

Lockfile của dự án nên được đưa vào hệ thống quản lý mã nguồn. Khi build dự án bạn nên dùng lockfile để kiểm soát các phiên bản phụ thuộc được cài: trong npm, bạn làm điều này bằng cách dùng [`npm ci`](https://docs.npmjs.com/cli/commands/npm-ci/) thay vì `npm install`.

> [!NOTE]
> Việc cố định phiên bản phụ thuộc theo cách này đôi khi được gọi là "version pinning".

Điều này có nghĩa là để cập nhật phụ thuộc, hệ thống build của bạn phải tạo một pull request để cập nhật lockfile, và điều đó cho bạn cơ hội review bản cập nhật cũng như bảo đảm rằng bạn muốn chấp nhận nó.

#### Review các bản cập nhật

Khi review một bản cập nhật cho một phụ thuộc, hãy cân nhắc xem đó có phải là bản cập nhật bạn muốn chấp nhận hay không:

- Đọc changelog của bản phát hành để hiểu nó nói rằng nó cung cấp những gì (và liệu bạn có cần chấp nhận nó ở thời điểm này hay không).
- Xem nó có thêm bất kỳ phụ thuộc nào khác không.
- Nếu có thể, review các cập nhật mã nguồn, và xem có thay đổi nào không thể giải thích hoặc không khớp với changelog hay không.
- Cân nhắc chờ thêm một thời gian trước khi cập nhật: thường thì các cuộc tấn công chuỗi cung ứng được các nhà nghiên cứu bảo mật phát hiện khá nhanh, và sẽ tốt hơn cho bạn nếu một bản cập nhật bị phát hiện là độc hại trước khi bạn chấp nhận nó.

### Duy trì Software Bill of Materials

Để có cái nhìn sâu hơn về các phụ thuộc của bạn, bạn có thể duy trì một danh mục chi tiết về chúng. Điều này được gọi là _Software Bill of Materials_ (SBOM).

Lockfile thực ra cũng là một dạng SBOM: tuy nhiên, thuật ngữ "SBOM" thường dùng để chỉ một định dạng chuẩn riêng để biểu diễn các phụ thuộc. Những chuẩn này thường vừa rộng hơn vừa sâu hơn lockfile. Nghĩa là:

- Chúng có thể ghi nhận các phụ thuộc, chẳng hạn dịch vụ web, vốn không được biểu diễn trong lockfile.
- Chúng có thể ghi nhận thêm thông tin về từng phụ thuộc, vốn không được biểu diễn trong lockfile.

Dùng một định dạng chuẩn để biểu diễn SBOM cũng có nghĩa là bạn có thể:

- Chia sẻ SBOM của bạn với bên thứ ba
- Tích hợp các công cụ hiểu được SBOM của bạn cho các mục đích như tuân thủ quy định hoặc giám sát lỗ hổng.

Hai chuẩn phổ biến nhất để biểu diễn một software bill of materials là:

- [CycloneDX](https://cyclonedx.org/), ban đầu do [OWASP](https://owasp.org/) phát triển.
- [SPDX](https://spdx.dev/), do [Linux Foundation](https://www.linuxfoundation.org/) duy trì.

Cả hai chuẩn này đều được hỗ trợ tốt, và bạn có thể dùng bất kỳ chuẩn nào để biểu diễn SBOM cho dự án của mình. SPDX ban đầu tập trung giúp sản phẩm bảo đảm tuân thủ giấy phép phần mềm nguồn mở, nhưng sau đó đã thêm các tính năng hỗ trợ các trường hợp sử dụng về bảo mật. CycloneDX là một chuẩn mới hơn và nhẹ hơn, được tập trung ngay từ đầu vào việc thúc đẩy bảo mật chuỗi cung ứng.

#### Cấu trúc của SBOM

> [!NOTE]
> Trong phần này, chúng ta sẽ dùng CycloneDX làm ví dụ cụ thể cho một định dạng SBOM.
>
> Phần này chỉ cung cấp một giới thiệu ngắn gọn về một vài phần cơ bản nhất của mô hình đối tượng CycloneDX. Để biết đầy đủ chi tiết, xem [Authoritative Guide to SBOM](https://cyclonedx.org/guides/OWASP_CycloneDX-Authoritative-Guide-to-SBOM-en.pdf) của CycloneDX.

Trong CycloneDX, mọi phụ thuộc đều là _components_ hoặc _services_.

- Components bao gồm, nhưng không giới hạn ở, framework phần mềm, thư viện, ứng dụng, và dữ liệu cấu hình.
- Services đại diện cho các API bên ngoài mà phần mềm có thể gọi, ví dụ qua endpoint URI.

Mỗi component và service được dùng trong sản phẩm, dù trực tiếp hay gián tiếp, đều được biểu diễn bằng một đối tượng trong SBOM. Đối tượng này bao gồm thông tin về mục đó như tên, phiên bản, tác giả, giấy phép, mô tả, {{glossary("hash_function", "hashes")}} (đối với components) và endpoint URI (đối với services).

SBOM cũng liệt kê các lỗ hổng đã được xác định trong các phụ thuộc của sản phẩm. Mỗi mục trong danh sách này chứa thông tin về lỗ hổng đó, bao gồm mô tả, một bộ mã [CWE](https://cwe.mitre.org/index.html), biện pháp giảm thiểu, liên kết tới advisories, và các định danh của các components hoặc services mà lỗ hổng ảnh hưởng.

#### Tạo SBOM

Bạn có thể tạo SBOM cho một sản phẩm bằng một công cụ riêng như [cdxgen](https://cdxgen.github.io/cdxgen/#/) hoặc một lệnh như [`npm sbom`](https://docs.npmjs.com/cli/commands/npm-sbom/). SBOM thường được tạo trong quá trình build, mặc dù cũng có thể tạo ở các giai đoạn khác của vòng đời phần mềm.

#### Sử dụng SBOM

SBOM cho phép bạn triển khai một số biện pháp phòng vệ chống lại các cuộc tấn công chuỗi cung ứng, và ở đây chúng ta sẽ liệt kê ba biện pháp quan trọng:

- **Quản lý lỗ hổng**: một trong những công dụng chính của SBOM là phản ứng với các lỗ hổng đã được xác định trong các phụ thuộc của bạn. Bạn có thể dùng các công cụ bên thứ ba như [Dependency-Track](https://dependencytrack.org/) của OWASP, vốn tự động hóa việc này bằng cách quét các nguồn báo cáo lỗ hổng như [NIST National Vulnerability Database](https://nvd.nist.gov/) hoặc [GitHub Advisories](https://github.com/advisories).
- **Xác minh tính toàn vẹn**: nếu SBOM chứa hash cho các phụ thuộc, bạn có thể xác minh rằng nguồn của component mà bạn phụ thuộc vào chưa bị sửa đổi so với bản phát hành gốc.
- **Quản lý rủi ro nhà cung cấp**: bằng cách ghi lại thông tin về nhà cung cấp của các phụ thuộc, SBOM có thể giúp bạn hiểu khi nào bạn đang phụ thuộc vào các components hoặc services từ những nhà cung cấp không còn được xem là đáng tin cậy.

### Dùng Subresource Integrity

Nhiều website bao gồm các script được host bên ngoài: nổi bật nhất, nhưng không chỉ giới hạn ở đó, là các script được phục vụ từ một {{glossary("CDN", "Content Delivery Network (CDN)")}}:

```html
<script src="https://cdn.example.org/library.js"></script>
```

Điều này tạo ra rủi ro cho chuỗi cung ứng của bạn: nếu kẻ tấn công chiếm được miền `cdn.example.org`, họ có thể thay script bằng một script độc hại, và do đó xâm phạm site của bạn.

Các script bên ngoài, giống như các phụ thuộc phần mềm khác, nên là một phần của SBOM của bạn, nhưng một biện pháp phòng vệ bổ sung là đặt thuộc tính [`integrity`](/en-US/docs/Web/HTML/Reference/Elements/script#integrity) của script:

```html
<script
  src="https://cdn.example.org/library.js"
  integrity="sha256-d5f450f7ce715d827de27ca569e183f819d33c1e7601875fd61eccbc98f56c5b"></script>
```

Giá trị của thuộc tính này chứa một {{glossary("hash_function", "cryptographic hash")}} của nội dung script. Nếu script đã bị kẻ tấn công sửa đổi, trình duyệt sẽ từ chối tải nó, và bạn sẽ được bảo vệ.

Điều này cũng làm tăng thêm gánh nặng bảo trì: mỗi khi nguồn thay đổi (ví dụ, mỗi khi một phiên bản mới được phát hành) bạn phải cập nhật giá trị của thuộc tính trong mã của mình.

Phần tử {{htmlelement("link")}} cũng hỗ trợ thuộc tính `integrity`, vì vậy bạn có thể (và nên) dùng nó cho stylesheet CSS cũng như script.

Xem thêm [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) để biết thêm chi tiết.

## Danh sách kiểm tra tóm tắt phòng vệ

- Yêu cầu {{glossary("multi-factor authentication")}} cho các thành viên nhóm và giảm thiểu các quyền được cấp.
- Đánh giá các công cụ tham gia vào quá trình build, test, và triển khai của bạn.
- Bảo đảm pull request phải qua review và vượt qua các kiểm tra {{glossary("continuous integration")}}.
- Giảm thiểu số lượng phụ thuộc của bạn, và có một quy trình đánh giá các phụ thuộc mới.
- Dùng lockfile để kiểm soát các cập nhật phụ thuộc, và có một quy trình chấp nhận cập nhật.
- Duy trì một SBOM và dùng nó để kiểm tra lỗ hổng.
- Dùng Subresource Integrity cho các script và stylesheet được tham chiếu bên ngoài.

## Xem thêm

- [Software Supply Chain Security](https://cheatsheetseries.owasp.org/cheatsheets/Software_Supply_Chain_Security_Cheat_Sheet.html) tại [owasp.org](https://owasp.org/)
- [OpenJS Security Collaboration Space](https://github.com/openjs-foundation/security-wg?tab=readme-ov-file#documents--guides) - Một trung tâm tập hợp hướng dẫn và tài nguyên bảo mật cho hệ sinh thái JavaScript, bao gồm:
  - [SBOM and Supply Chain Security Challenges](https://github.com/openjs-foundation/security-wg/blob/main/docs/SBOM/OpenJS-SBOM-CSCRM-Challenges-Recommendations.md) - Khuyến nghị cho SBOM JavaScript và attestation phần mềm
  - [Security Compliance Guidelines](https://github.com/openjs-foundation/security-wg/blob/main/docs/OpenJS_Security_Compliance_Guidelines/v1/readme.md) - Một checklist toàn diện cho bảo mật vận hành
  - [npm Security Best Practices Guide](https://github.com/openjs-foundation/security-wg/blob/main/docs/npm-security-best-practices.md) - Thực hành tốt nhất để bảo vệ các gói và phụ thuộc npm
  - [Secure Releases Guide](https://github.com/openjs-foundation/security-wg/blob/main/docs/Secure_Releases/secure-releases.md) - Hướng dẫn tạo các bản phát hành phần mềm an toàn
