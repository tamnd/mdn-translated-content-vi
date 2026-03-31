---
title: Permissions Policy
slug: Web/HTTP/Guides/Permissions_Policy
page-type: guide
status:
  - experimental
browser-compat: http.headers.Permissions-Policy
sidebar: http
---

{{SeeCompatTable}}

**Permissions Policy** cung cấp các cơ chế để các nhà phát triển web khai báo rõ ràng chức năng nào có thể và không thể được sử dụng trên trang web. Bạn xác định một tập hợp "chính sách" hạn chế các API nào mà code của trang web có thể truy cập hoặc sửa đổi hành vi mặc định của trình duyệt cho một số tính năng nhất định. Điều này cho phép bạn thực thi các thực hành tốt nhất, ngay cả khi codebase phát triển — cũng như soạn thảo nội dung của bên thứ ba an toàn hơn.

Permissions Policy tương tự như {{Glossary("CSP", "Content Security Policy")}} nhưng kiểm soát các tính năng thay vì hành vi bảo mật.

Ví dụ về những gì bạn có thể làm với Permissions Policy:

- Thay đổi hành vi mặc định của autoplay trên thiết bị di động và video của bên thứ ba.
- Hạn chế trang web sử dụng các thiết bị nhạy cảm như camera, microphone hoặc loa.
- Cho phép iframes sử dụng [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API).
- Dừng các mục khỏi bị script hóa nếu chúng không hiển thị trong viewport, để cải thiện hiệu suất.

> [!NOTE]
> Permissions Policy trước đây được gọi là Feature Policy. Tên đã thay đổi, và cú pháp HTTP header cũng vậy, vì vậy hãy ghi nhớ điều này nếu bạn đã sử dụng Feature Policy trong quá khứ và kiểm tra bảng hỗ trợ trình duyệt. Cú pháp `<iframe allow=" ... ">` vẫn giữ nguyên.

## Khái niệm và cách sử dụng

Web cung cấp chức năng và API có thể có rủi ro về quyền riêng tư hoặc bảo mật nếu bị lạm dụng. Trong những trường hợp như vậy, bạn có thể muốn hạn chế chặt chẽ cách chức năng được sử dụng trên trang web. Trong mỗi trường hợp, nên có cách trực quan hoặc không gây gián đoạn để các nhà phát triển web phát hiện và xử lý các trường hợp tính năng bị tắt.

Một số phương pháp bao gồm:

- "Permission denied" được trả về cho các API JavaScript yêu cầu người dùng cấp quyền.
- Các API JavaScript cung cấp quyền truy cập vào các tính năng trả về giá trị `false` hoặc ném lỗi.
- Các API thậm chí không được hiển thị, như thể chúng không tồn tại.
- Các tùy chọn kiểm soát hành vi tính năng có các giá trị mặc định khác nhau.

> [!NOTE]
> Các tính năng mới được giới thiệu có thể có API rõ ràng để báo hiệu trạng thái. Các tính năng hiện có sau đó tích hợp với Permissions Policy thường sẽ sử dụng các cơ chế hiện có.

Permissions Policy cho phép bạn kiểm soát nguồn gốc nào có thể sử dụng tính năng nào, cả trên trang cấp cao nhất và trong {{htmlelement("iframe")}} được nhúng. Mục tiêu là thực thi các thực hành tốt nhất cho trải nghiệm người dùng tốt và cung cấp kiểm soát chi tiết đối với các tính năng _nhạy cảm_ hoặc _mạnh mẽ_ (có nghĩa là các tính năng mà người dùng được yêu cầu cấp phép rõ ràng để sử dụng trước khi code liên quan có thể được thực thi).

Permissions Policy cung cấp hai cách để chỉ định chính sách:

- Header HTTP {{httpheader("Permissions-Policy")}}, để kiểm soát việc sử dụng tính năng trong các phản hồi nhận được và bất kỳ nội dung nhúng nào trong trang (bao gồm {{htmlelement("iframe")}}).
- Thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#attributes) của {{htmlelement("iframe")}}, để kiểm soát việc sử dụng tính năng chỉ trong các {{htmlelement("iframe")}} cụ thể.

Đây là hai cách riêng biệt nhưng có liên quan — xem [Kế thừa chính sách cho nội dung nhúng](#inheritance_of_policies_for_embedded_content) để biết chi tiết.

> [!NOTE]
> Các script có thể lập trình truy vấn thông tin về chính sách quyền thông qua đối tượng {{DOMxRef("FeaturePolicy")}} nằm tại {{DOMxRef("Document.featurePolicy")}} hoặc {{DOMxRef("HTMLIFrameElement.featurePolicy")}}.

Để kiểm soát mỗi tính năng, bạn viết chính sách bao gồm:

- Một **chỉ thị** xác định tên của tính năng cần kiểm soát. Xem [danh sách các chỉ thị khác nhau có sẵn](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#directives).
- Một **allowlist**, là danh sách các nguồn gốc mà tính năng nên được kiểm soát. Bạn có thể kích hoạt tính năng cho tất cả hoặc các nguồn gốc cụ thể, hoặc chặn việc sử dụng nó trong tất cả các nguồn gốc.

Xem bên dưới để biết nhiều ví dụ.

## Mối quan hệ với Permissions API

Permissions Policy và {{domxref("Permissions API", "Permissions API", "", "nocode")}} có liên quan chặt chẽ, nhưng khác nhau. Các tính năng có quyền của chúng được kiểm soát bởi cả hai công nghệ này chồng chéo.

- Permissions Policy cho phép máy chủ đặt liệu tính năng có thể được sử dụng trong tài liệu cụ thể (hoặc `<frame>` nhúng trong đó) hay không. Những tính năng này được gọi là **policy-controlled** features — xem [danh sách các chỉ thị Permissions Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#directives).
- Permissions API kiểm soát quyền truy cập vào các tính năng dựa trên quyền do người dùng cấp. Các tính năng này được ghi lại trong [Permissions Registry](https://w3c.github.io/permissions-registry/).

Chuỗi nhận dạng được sử dụng cho mỗi tính năng được giữ nhất quán trên cả hai, ví dụ: `geolocation` cho {{domxref("Geolocation API", "Geolocation API", "", "nocode")}}. Hầu hết các tính năng API trong Permissions Registry cũng có chỉ thị Permissions Policy tương ứng. Một ngoại lệ là {{domxref("Notifications API", "Notifications API", "", "nocode")}}.

Nói chung khi Permissions Policy chặn việc sử dụng tính năng mạnh mẽ, người dùng thậm chí sẽ không được hỏi quyền để sử dụng nó và phương thức {{domxref("Permissions.query", "query()")}} của Permissions API sẽ trả về giá trị {{domxref("PermissionStatus.state", "state")}} là `denied`.

Xem thêm [Permissions > Relationship to the Permissions Policy specification](https://w3c.github.io/permissions/#relationship-to-permissions-policy).

## Allowlists

Allowlist là danh sách các nguồn gốc nhận một hoặc nhiều giá trị sau được chứa trong dấu ngoặc đơn, phân tách bằng khoảng trắng:

- `*`: Tính năng sẽ được phép trong tài liệu này, và tất cả ngữ cảnh duyệt web lồng nhau (`<iframe>`) bất kể nguồn gốc của chúng.
- `()` (allowlist trống): Tính năng bị tắt trong ngữ cảnh duyệt web cấp cao nhất và lồng nhau. Tương đương cho thuộc tính `allow` của `<iframe>` là `'none'`.
- `self`: Tính năng sẽ được phép trong tài liệu này, và trong tất cả ngữ cảnh duyệt web lồng nhau (`<iframe>`) chỉ trong cùng nguồn gốc. Tính năng không được phép trong tài liệu xuyên nguồn gốc trong ngữ cảnh duyệt web lồng nhau. `self` có thể được coi là viết tắt cho `https://your-site.example.com`. Tương đương cho thuộc tính `allow` của `<iframe>` là `'self'`.
- `'src'`: Tính năng sẽ được phép trong `<iframe>` này, miễn là tài liệu được tải vào nó đến từ cùng nguồn gốc với URL trong thuộc tính {{HTMLElement('iframe','src','#Attributes')}} của nó. Giá trị này chỉ được sử dụng trong thuộc tính `allow` của `<iframe>` và là giá trị allowlist _mặc định_ trong `<iframe>`.
- `"<origin>"`: Tính năng được phép cho các nguồn gốc cụ thể (ví dụ: `"https://a.example.com"`). Các nguồn gốc nên được phân tách bằng khoảng trắng. Lưu ý rằng các nguồn gốc trong thuộc tính allow của `<iframe>` không được trích dẫn.

Các giá trị `*` và `()` chỉ có thể được sử dụng riêng lẻ, trong khi `self` và `src` có thể được sử dụng kết hợp với một hoặc nhiều nguồn gốc.

> [!NOTE]
> Các chỉ thị có allowlist mặc định, luôn là một trong `*`, `self` hoặc `none` cho header HTTP `Permissions-Policy`, và điều chỉnh hành vi mặc định nếu chúng không được liệt kê rõ ràng trong chính sách. Những điều này được chỉ định trên các [trang tham khảo chỉ thị riêng lẻ](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#directives). Đối với thuộc tính `allow` của `<iframe>`, hành vi mặc định luôn là `src`.

Khi được hỗ trợ, bạn có thể bao gồm ký tự đại diện trong các nguồn gốc Permissions Policy. Điều này có nghĩa là thay vì phải chỉ định rõ ràng một số tên miền con khác nhau trong allowlist, bạn có thể chỉ định tất cả chúng trong một nguồn gốc duy nhất với ký tự đại diện.

Vì vậy, thay vì

```http
("https://example.com" "https://a.example.com" "https://b.example.com" "https://c.example.com")
```

Bạn có thể chỉ định

```http
("https://example.com" "https://*.example.com")
```

> [!NOTE]
> `"https://*.example.com"` không khớp `"https://example.com"`.

Ví dụ về allowlist:

- `*`
- `()`
- `(self)`
- `(src)`
- `("https://a.example.com")`
- `("https://a.example.com" "https://b.example.com")`
- `(self "https://a.example.com" "https://b.example.com")`
- `(src "https://a.example.com" "https://b.example.com")`
- `("https://*.example.com")`

## Cú pháp header Permissions-Policy

Cú pháp chung trông như thế này:

```http
Permissions-Policy: <directive>=<allowlist>
```

Vì vậy, ví dụ để chặn tất cả quyền truy cập vào vị trí địa lý, bạn sẽ làm điều này:

```http
Permissions-Policy: geolocation=()
```

Hoặc để cho phép truy cập vào một tập hợp nguồn gốc, bạn sẽ làm điều này:

```http
Permissions-Policy: geolocation=(self "https://a.example.com" "https://b.example.com")
```

Một số tính năng có thể được kiểm soát cùng một lúc bằng cách gửi header với danh sách chính sách phân tách bằng dấu phẩy, hoặc bằng cách gửi header riêng biệt cho mỗi chính sách.

Ví dụ: sau đây là tương đương:

```http
Permissions-Policy: picture-in-picture=(), geolocation=(self "https://example.com"), camera=*;

Permissions-Policy: picture-in-picture=()
Permissions-Policy: geolocation=(self "https://example.com")
Permissions-Policy: camera=*
```

## Cú pháp frame nhúng

Để một {{htmlelement("iframe")}} có tính năng được kích hoạt, nguồn gốc được phép của nó cũng phải có trong allowlist cho trang cha. Vì [hành vi kế thừa](#inheritance_of_policies_for_embedded_content) này, nên chỉ định hỗ trợ rộng nhất có thể chấp nhận cho tính năng trong HTTP header, sau đó chỉ định tập hợp hỗ trợ bạn cần trong mỗi `<iframe>`.

Cú pháp chung trông như thế này:

```html
<iframe src="<origin>" allow="<directive> <allowlist>"></iframe>
```

Vì vậy, ví dụ để chặn tất cả quyền truy cập vào vị trí địa lý, bạn sẽ làm điều này:

```html
<iframe src="https://example.com" allow="geolocation 'none'"></iframe>
```

Để áp dụng chính sách cho nguồn gốc hiện tại và các nguồn gốc khác, bạn sẽ làm điều này:

```html
<iframe
  src="https://example.com"
  allow="geolocation 'self' https://a.example.com https://b.example.com"></iframe>
```

Điều này quan trọng: Theo mặc định, nếu `<iframe>` điều hướng đến nguồn gốc khác, chính sách không được áp dụng cho nguồn gốc mà `<iframe>` điều hướng đến. Bằng cách liệt kê nguồn gốc mà `<iframe>` điều hướng đến trong thuộc tính `allow`, Permissions Policy được áp dụng cho `<iframe>` gốc sẽ được áp dụng cho nguồn gốc mà `<iframe>` điều hướng đến.

Một số tính năng có thể được kiểm soát cùng một lúc bằng cách bao gồm danh sách chỉ thị chính sách được phân tách bằng dấu chấm phẩy bên trong thuộc tính `allow`.

```html
<iframe
  src="https://example.com"
  allow="geolocation 'self' https://a.example.com https://b.example.com; fullscreen 'none'"></iframe>
```

Đáng chú ý khi đề cập đến giá trị `src`. Chúng ta đã đề cập ở trên rằng việc sử dụng giá trị allowlist này có nghĩa là tính năng liên quan sẽ được phép trong `<iframe>` này, miễn là tài liệu được tải vào nó đến từ cùng nguồn gốc với URL trong thuộc tính {{HTMLElement('iframe','src','#Attributes')}} của nó. Giá trị này là giá trị `allowlist` _mặc định_ cho các tính năng được liệt kê trong `allow`, vì vậy sau đây là tương đương:

```html
<iframe src="https://example.com" allow="geolocation 'src'"></iframe>
<iframe src="https://example.com" allow="geolocation"></iframe>
```

> [!NOTE]
> Như bạn đã nhận thấy, cú pháp cho chính sách `<iframe>` hơi khác với cú pháp cho header `Permissions-Policy`. Cú pháp trước vẫn sử dụng cú pháp tương tự như đặc tả Feature Policy cũ hơn, đã được Permissions Policy thay thế.

### Fenced frames và permissions policy

{{htmlelement("fencedframe")}} tương tác với các chính sách quyền theo cách tương tự như `<iframe>`, nhưng theo cách hạn chế hơn nhiều. Chỉ các tính năng cụ thể được thiết kế để sử dụng trong `<fencedframe>` mới có thể được kích hoạt qua các chính sách quyền được đặt trên chúng; các tính năng được kiểm soát chính sách khác không có sẵn trong ngữ cảnh này.

Xem [Permissions policies available to fenced frames](/en-US/docs/Web/HTML/Reference/Elements/fencedframe#permissions_policies_available_to_fenced_frames) để biết thêm chi tiết.

## Kế thừa chính sách cho nội dung nhúng

Các script kế thừa chính sách của ngữ cảnh duyệt web của chúng, bất kể nguồn gốc của chúng. Điều đó có nghĩa là các script cấp cao nhất kế thừa chính sách từ tài liệu chính.

Tất cả `<iframe>` kế thừa chính sách của trang cha của chúng. Nếu `<iframe>` có thuộc tính `allow` _và_ trang cha có {{HTTPHeader("Permissions-Policy")}}, các chính sách của trang cha và thuộc tính `allow` được kết hợp, sử dụng tập hợp con hạn chế nhất. Để `<iframe>` có tính năng được kích hoạt, nguồn gốc phải có trong allowlist cho cả trang cha và thuộc tính `allow`.

Việc tắt tính năng trong chính sách là một chiều duy nhất. Nếu tính năng đã bị tắt cho frame con bởi frame cha, frame con không thể bật lại nó, và không có bất kỳ con nào của frame con có thể làm vậy.

## Ví dụ

### Kết hợp header HTTP và chính sách `<iframe>`

Ví dụ: giả sử chúng ta muốn kích hoạt việc sử dụng vị trí địa lý trên nguồn gốc của riêng chúng ta và trong nội dung nhúng đến từ mạng quảng cáo đáng tin cậy của chúng ta. Chúng ta có thể thiết lập Permissions Policy trên toàn trang như thế này:

```http
Permissions-Policy: geolocation=(self "https://trusted-ad-network.com")
```

Trong các `<iframe>` quảng cáo của chúng ta, chúng ta có thể đặt quyền truy cập vào nguồn gốc `https://trusted-ad-network.com` như thế này:

```html
<iframe src="https://trusted-ad-network.com" allow="geolocation"></iframe>
```

Nếu nguồn gốc khác được tải vào `<iframe>`, nó sẽ không có quyền truy cập vào vị trí địa lý:

```html
<iframe src="https://rogue-origin-example.com" allow="geolocation"></iframe>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header HTTP {{HTTPHeader("Permissions-Policy")}}
- Thuộc tính {{HTMLElement("iframe", "allow", "#Attributes")}} trên iframes
- [Controlling browser features with Permissions Policy](https://developer.chrome.com/docs/privacy-security/permissions-policy): hướng dẫn sử dụng cũng chứa một số liên kết demo.
- [Permissions/Feature policies on chromestatus.com](https://chromestatus.com/features#component%3A%20Blink%3EFeaturePolicy)
- [Quyền riêng tư, quyền và bảo mật thông tin](/en-US/docs/Web/Privacy)
