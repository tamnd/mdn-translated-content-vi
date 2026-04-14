---
title: <script type="speculationrules">
short-title: speculationrules
slug: Web/HTML/Reference/Elements/script/type/speculationrules
page-type: html-attribute-value
status:
  - experimental
browser-compat: html.elements.script.type.speculationrules
sidebar: htmlsidebar
---

{{SeeCompatTable}}

Giá trị **`speculationrules`** của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/script/type) của [phần tử `<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) chỉ ra rằng phần thân của phần tử chứa speculation rules.

Speculation rules có dạng một cấu trúc JSON xác định những tài nguyên nào nên được tải trước hoặc prerender bởi trình duyệt. Đây là một phần của {{domxref("Speculation Rules API", "", "", "nocode")}}.

> [!NOTE]
> Speculation rules có thể được định nghĩa bên trong các tệp văn bản bên ngoài được tham chiếu bởi HTTP header {{httpheader("Speculation-Rules")}}, sử dụng cùng [định dạng JSON được cung cấp bên dưới](#speculation_rules_json_representation). Việc chỉ định một HTTP header hữu ích trong các trường hợp mà các nhà phát triển không có khả năng trực tiếp sửa đổi tài liệu.

## Cú pháp

```html
<script type="speculationrules">
  // JSON object defining rules
</script>
```

> [!NOTE]
> Các thuộc tính `src`, `async`, `nomodule`, `defer`, `crossorigin`, `integrity`, và `referrerpolicy` không được chỉ định.

### Ngoại lệ

- `TypeError`
  - : Định nghĩa speculation rules không phải là đối tượng JSON hợp lệ.

## Mô tả

Một phần tử `<script type="speculationrules">` phải chứa một cấu trúc JSON hợp lệ xác định speculation rules. Các ví dụ sau đây hiển thị các quy tắc prefetch và prerender riêng biệt:

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "urls": ["next.html", "next2.html"],
        "requires": ["anonymous-client-ip-when-cross-origin"],
        "referrer_policy": "no-referrer"
      }
    ]
  }
</script>
```

```html
<script type="speculationrules">
  {
    "prerender": [
      {
        "where": { "href_matches": "/next" },
        "eagerness": "eager"
      }
    ]
  }
</script>
```

### Định dạng biểu diễn JSON của speculation rules

Cấu trúc JSON chứa một hoặc nhiều trường ở cấp độ cao nhất, mỗi trường đại diện cho một hành động để xác định speculation rules. Hiện tại các hành động được hỗ trợ là:

- `"prefetch"` {{optional_inline}} {{experimental_inline}}
  - : Các quy tắc cho các điều hướng tiềm năng trong tương lai nên có phần thân phản hồi tài liệu liên quan được tải xuống, dẫn đến cải thiện hiệu suất đáng kể khi điều hướng đến các tài liệu đó. Lưu ý rằng không có tài nguyên con nào được tham chiếu bởi trang được tải xuống.
- `"prerender"` {{optional_inline}} {{experimental_inline}}
  - : Các quy tắc cho các điều hướng tiềm năng trong tương lai nên có tài liệu liên quan được tải xuống đầy đủ, hiển thị và tải vào một tab ẩn. Điều này bao gồm tải tất cả tài nguyên con, chạy tất cả JavaScript, và thậm chí tải tài nguyên con và thực hiện các lấy dữ liệu được khởi động bởi JavaScript. Khi điều hướng đến các tài liệu đó, điều hướng sẽ là ngay lập tức, dẫn đến cải thiện hiệu suất lớn.

> [!NOTE]
> Hãy tham khảo trang chính [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) để biết chi tiết đầy đủ về cách sử dụng prefetch và prerender hiệu quả.

Mỗi trường hành động chứa một mảng, lần lượt chứa một hoặc nhiều đối tượng. Mỗi đối tượng chứa một quy tắc duy nhất xác định một tập hợp URL và các tham số liên quan.

Mỗi đối tượng có thể chứa các thuộc tính sau:

- `"source"` {{experimental_inline}}
  - : Một chuỗi chỉ ra nguồn của các URL mà quy tắc áp dụng. Điều này là tùy chọn vì giá trị có thể luôn được suy ra từ các thuộc tính khác.

    Có thể là một trong:
    - `"document"`
      - : Chỉ định rằng các URL sẽ được khớp từ các liên kết điều hướng trong tài liệu liên quan (như được xác định trong các phần tử {{htmlelement("a")}} và {{htmlelement("area")}}), dựa trên các điều kiện được mô tả bởi khóa `"where"`. Lưu ý rằng sự hiện diện của khóa `"where"` ngụ ý `"source": "document"`, vì vậy là tùy chọn.
    - `"list"`
      - : Chỉ định rằng các URL sẽ đến từ một danh sách, được chỉ định trong khóa `"urls"`. Lưu ý rằng sự hiện diện của khóa `"urls"` ngụ ý `"source": "list"`, vì vậy là tùy chọn.

- `"urls"` {{experimental_inline}}
  - : Một mảng chuỗi đại diện cho danh sách URL để áp dụng quy tắc. Chúng có thể là URL tuyệt đối hoặc tương đối. Các URL tương đối sẽ được phân tích tương đối với URL cơ sở của tài liệu (nếu nội tuyến trong tài liệu) hoặc tương đối với URL tài nguyên bên ngoài (nếu được lấy từ bên ngoài). `"urls"` và `"where"` không thể cùng được đặt trong cùng một quy tắc.

- `"where"` {{experimental_inline}}
  - : Một đối tượng đại diện cho các điều kiện mà quy tắc khớp các URL có trong tài liệu liên quan. Về cơ bản, đối tượng `"where"` đại diện cho một bài kiểm tra được thực hiện trên mỗi liên kết trên trang để xem liệu quy tắc speculation có được áp dụng cho nó không. `"where"` và `"urls"` không thể cùng được đặt trong cùng một quy tắc.

    Đối tượng này có thể chứa chính xác một trong các thuộc tính sau:
    - `"href_matches"`
      - : Một chuỗi chứa một mẫu URL, hoặc một mảng chứa nhiều chuỗi mẫu URL, tuân theo [cú pháp URL Pattern API](/en-US/docs/Web/API/URL_Pattern_API) chuẩn. Các liên kết trong tài liệu có URL khớp với mẫu sẽ có quy tắc được áp dụng.
    - `"relative_to"`
      - : Trong trường hợp điều kiện `"href_matches"`, điều này có thể chỉ định nơi bạn muốn điều kiện đó được khớp tương đối. Điều này hoạt động theo cách giống như [khóa `"relative_to"` cấp quy tắc](#relative_to_2), ngoại trừ nó chỉ ảnh hưởng đến một điều kiện `"href_matches"` duy nhất bên trong khóa `"where"`.
    - `"selector_matches"`
      - : Một chuỗi chứa một [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors), hoặc một mảng chứa nhiều bộ chọn CSS. Các liên kết trong tài liệu được khớp bởi các bộ chọn đó sẽ có quy tắc được áp dụng.
    - `"and"`
      - : Một mảng chứa một hoặc nhiều đối tượng chứa điều kiện (`"href_matches"`, `"selector_matches"`, `"and"`, `"not"`, hoặc `"or"`), tất cả phải khớp để quy tắc được áp dụng cho chúng.
    - `"not"`
      - : Một đối tượng chứa một điều kiện (`"href_matches"`, `"selector_matches"`, `"and"`, `"not"`, hoặc `"or"`) mà nếu khớp, _không_ có quy tắc được áp dụng cho nó. Tất cả các liên kết _không_ khớp với điều kiện _sẽ_ có quy tắc được áp dụng.
    - `"or"`
      - : Một mảng chứa một hoặc nhiều đối tượng chứa điều kiện (`"href_matches"`, `"selector_matches"`, `"and"`, `"not"`, hoặc `"or"`), bất kỳ điều kiện nào có thể khớp để quy tắc được áp dụng cho chúng.

    Các điều kiện `"where"` có thể được lồng nhau nhiều cấp để tạo ra các điều kiện phức tạp, hoặc bạn có thể chọn tách chúng thành các quy tắc riêng biệt để giữ chúng đơn giản. Xem [ví dụ where](#where_syntax_examples) để biết thêm giải thích và nhiều ví dụ sử dụng.

- `"eagerness"` {{experimental_inline}}
  - : Một chuỗi cung cấp gợi ý cho trình duyệt về mức độ nhiệt tình khi prefetch/prerender các đích liên kết để cân bằng lợi thế hiệu suất với chi phí tài nguyên. Các giá trị có thể là:
    - `"immediate"`
      - : Tác giả cho rằng liên kết rất có khả năng được theo dõi, và/hoặc tài liệu có thể mất nhiều thời gian để lấy. Prefetch/prerender nên bắt đầu càng sớm càng tốt, chỉ tùy thuộc vào các cân nhắc như tùy chọn của người dùng và giới hạn tài nguyên.
    - `"eager"`
      - : Tác giả muốn prefetch/prerender một số lượng lớn các điều hướng, càng sớm càng tốt. Prefetch/prerender nên bắt đầu khi có bất kỳ gợi ý nhỏ nào rằng một liên kết có thể được theo dõi. Ví dụ, người dùng có thể di chuyển con trỏ chuột về phía liên kết, di chuột/tập trung vào nó trong một khoảnh khắc, hoặc dừng cuộn với liên kết ở một vị trí nổi bật.
    - `"moderate"`
      - : Tác giả đang tìm kiếm sự cân bằng giữa `eager` và `conservative`. Prefetch/prerender nên bắt đầu khi có gợi ý hợp lý rằng người dùng sẽ theo dõi một liên kết trong tương lai gần. Ví dụ, người dùng có thể cuộn một liên kết vào khung nhìn và di chuột/tập trung vào nó trong một khoảng thời gian.
    - `"conservative"`
      - : Tác giả muốn nhận được một số lợi ích từ tải đầu cơ với sự đánh đổi tài nguyên khá nhỏ. Prefetch/prerender chỉ nên bắt đầu khi người dùng bắt đầu nhấp vào liên kết, ví dụ khi {{domxref("Element.mousedown_event", "mousedown")}} hoặc {{domxref("Element.pointerdown_event", "pointerdown")}}.

    Nếu `"eagerness"` không được chỉ định rõ ràng, các quy tắc danh sách (`"urls"`) mặc định là `immediate` và các quy tắc tài liệu (`"where"`) mặc định là `conservative`. Trình duyệt tính đến gợi ý này cùng với các heuristic của chính nó, vì vậy nó có thể chọn một liên kết mà tác giả đã gợi ý là kém nhiệt tình hơn so với một liên kết khác, nếu ứng cử viên kém nhiệt tình hơn được coi là lựa chọn tốt hơn.

- `"expects_no_vary_search"` {{experimental_inline}}
  - : Một chuỗi cung cấp gợi ý cho trình duyệt về giá trị header {{httpheader("No-Vary-Search")}} sẽ được đặt trên các phản hồi cho các tài liệu mà nó đang nhận yêu cầu prefetch/prerender. Trình duyệt có thể sử dụng điều này để xác định trước liệu có hữu ích hơn khi chờ một prefetch/prerender hiện có hoàn thành hay bắt đầu một yêu cầu fetch mới khi quy tắc speculation được khớp.

- `"referrer_policy"` {{experimental_inline}}
  - : Một chuỗi đại diện cho một chuỗi chính sách referrer cụ thể để sử dụng khi yêu cầu các URL được chỉ định trong quy tắc — xem [`Referrer-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy) để biết các giá trị có thể. Mục đích của điều này là cho phép trang tham chiếu đặt một chính sách nghiêm ngặt hơn đặc biệt cho yêu cầu đầu cơ hơn là chính sách mà trang đã đặt (dù mặc định hay bằng cách sử dụng `Referrer-Policy`).

    > [!NOTE]
    > Một prefetch cross-site yêu cầu một chính sách referrer ít nhất cũng nghiêm ngặt như giá trị mặc định `"strict-origin-when-cross-origin"` — vì vậy `"strict-origin-when-cross-origin"`, `"same-origin"`, `"strict-origin"`, hoặc `"no-referrer"`. Một chính sách lỏng hơn được đặt trong speculation rules sẽ ghi đè một chính sách nghiêm ngặt hơn được đặt trên trang tham chiếu miễn là nó vẫn đủ nghiêm ngặt cho trường hợp cross-site.

    > [!NOTE]
    > Trong trường hợp quy tắc tài liệu, chính sách referrer được chỉ định của liên kết được khớp (ví dụ, sử dụng thuộc tính [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/a#referrerpolicy)) sẽ được sử dụng, trừ khi quy tắc chỉ định một chính sách ghi đè nó.

- `"relative_to"` {{experimental_inline}}
  - : Một chuỗi chỉ định nơi bạn muốn các liên kết được khớp theo URL được khớp tương đối. Giá trị có thể là một trong:
    - `document`
      - : Các URL nên được khớp tương đối với tài liệu mà speculation rules đang được đặt.
    - `ruleset`
      - : Các URL nên được khớp tương đối với tệp các quy tắc được chỉ định. Đây là giá trị mặc định.

    Cài đặt khóa này chỉ liên quan đến các quy tắc được xác định trong tệp bên ngoài (được đặt bằng cách sử dụng header {{httpheader("Speculation-Rules")}}). Khi các quy tắc được chỉ định bên trong cùng tài liệu mà chúng đang được đặt (tức là, trong một phần tử `<script>` nội tuyến), nó không tạo ra sự khác biệt.

- `"requires"` {{experimental_inline}}
  - : Một mảng chuỗi đại diện cho các khả năng của trình duyệt phân tích cú pháp quy tắc, phải có sẵn nếu quy tắc được áp dụng cho các URL được chỉ định.

    > [!WARNING]
    > Các prefetch sẽ tự động thất bại trong các trình duyệt không thể đáp ứng một yêu cầu được chỉ định, ngay cả khi chúng hỗ trợ [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API).

    Các giá trị có thể là:
    - `"anonymous-client-ip-when-cross-origin"`
      - : (chỉ prefetch) Chỉ định rằng quy tắc chỉ khớp nếu user agent có thể ngăn địa chỉ IP máy khách hiển thị với máy chủ origin nếu một yêu cầu prefetch cross-origin được phát hành. Cách thức hoạt động cụ thể phụ thuộc vào các chi tiết triển khai trình duyệt.

- `"tag"` {{experimental_inline}}
  - : Một chuỗi dùng để xác định một quy tắc hoặc tập quy tắc. Điều này sẽ được bao gồm trong request header {{HTTPHeader("Sec-Speculation-Tags")}} cho bất kỳ suy đoán nào được bao phủ bởi quy tắc đó.

- `"target_hint"` {{experimental_inline}}
  - : Một chuỗi chỉ ra nơi trang mong đợi nội dung được prerender sẽ được kích hoạt.
    Chỉ thị này không được hỗ trợ cho các suy đoán prefetch.
    Các giá trị được phép là:
    - `"target_hint": "_blank"`
      - : Mở nội dung được prerender trong một trang mới.
    - `"target_hint": "_self"`
      - : Mở nội dung được prerender trong trang hiện tại.
        Đây là mặc định, nếu không được chỉ định.

> [!NOTE]
> Vì speculation rules sử dụng phần tử `<script>`, chúng cần được phép rõ ràng trong chỉ thị [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) của [`Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy) nếu trang bao gồm nó. Điều này được thực hiện bằng cách thêm giá trị `"inline-speculation-rules"` cùng với nguồn hash- hoặc nonce-.

## Ví dụ

### Prefetch và prerender trong cùng một tập quy tắc

Các ví dụ cơ bản được hiển thị trong phần mô tả bao gồm các speculation rules riêng biệt được xác định cho prefetch và prerender. Có thể xác định cả hai trong một tập quy tắc duy nhất:

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "urls": ["next.html", "next2.html"],
        "requires": ["anonymous-client-ip-when-cross-origin"],
        "referrer_policy": "no-referrer"
      }
    ],
    "prerender": [
      {
        "where": { "selector_matches": ".product-link" },
        "eagerness": "eager"
      }
    ]
  }
</script>
```

> [!NOTE]
> Đoạn mã này cung cấp ví dụ quy tắc danh sách (`"urls"`) và quy tắc tài liệu (`"where"`).

### Nhiều tập quy tắc

Cũng được phép bao gồm nhiều tập quy tắc trong một tệp HTML:

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "urls": ["next.html", "next2.html"],
        "requires": ["anonymous-client-ip-when-cross-origin"],
        "referrer_policy": "no-referrer"
      }
    ]
  }
</script>
<script type="speculationrules">
  {
    "prerender": [
      {
        "where": { "selector_matches": ".product-link" },
        "eagerness": "eager"
      }
    ]
  }
</script>
```

Và nhiều quy tắc trong một tập kết quả duy nhất:

```html
<script type="speculationrules">
  {
    "prerender": [
      {
        "urls": ["one.html"]
      },
      {
        "urls": ["two.html"]
      }
    ]
  }
</script>
```

### Chèn quy tắc động

Dưới đây là một ví dụ phát hiện tính năng speculation rules và, nếu được hỗ trợ, động thêm một quy tắc prerender speculation qua JavaScript:

```js
if (
  HTMLScriptElement.supports &&
  HTMLScriptElement.supports("speculationrules")
) {
  const specScript = document.createElement("script");
  specScript.type = "speculationrules";
  const specRules = {
    prerender: [
      {
        urls: ["/next.html"],
      },
    ],
  };
  specScript.textContent = JSON.stringify(specRules);
  console.log("added speculation rules to: next.html");
  document.body.append(specScript);
}
```

### Ví dụ cú pháp `where`

Một quy tắc có nguồn tài liệu chứa thuộc tính `"where"`, là một đối tượng chứa các tiêu chí xác định liên kết nào trong tài liệu được khớp. Về cơ bản, đối tượng `"where"` đại diện cho một bài kiểm tra được thực hiện trên mỗi liên kết trên trang để xem liệu quy tắc speculation có được áp dụng cho nó không.

Phiên bản cơ bản nhất sẽ khớp một mẫu URL hoặc bộ chọn CSS:

```json
{ "where": { "href_matches": "/next" } }
```

```json
{ "where": { "selector_matches": ".important-link" } }
```

`"href_matches"` và `"selector_matches"` cũng có thể được đặt thành một mảng các giá trị, vì vậy nhiều mẫu URL hoặc bộ chọn CSS có thể được khớp đồng thời:

```json
{ "where": { "href_matches": ["/next", "/profile"] } }
```

```json
{ "where": { "selector_matches": [".important-link", "#unique-link"] } }
```

Mẫu URL và bộ chọn cũng có thể chứa các ký tự đại diện (`*`), cho phép một giá trị duy nhất khớp với nhiều URL. Ví dụ, đối tượng bên dưới có thể khớp với `user/`, `user/settings`, `user/stats`, v.v.

```json
{ "where": { "href_matches": "/user/*" } }
```

[Tham số tìm kiếm (hoặc chuỗi truy vấn)](/en-US/docs/Web/API/URL/search) cũng có thể được nhắm mục tiêu trong `href_matches`. Ví dụ, đối tượng bên dưới có thể khớp tất cả các URL cùng nguồn gốc với tham số tìm kiếm `category` (là tham số đầu tiên hoặc tham số tiếp theo):

```json
{ "where": { "href_matches": "/*\\?*(^|&)category=*" } }
```

Bất kỳ điều kiện nào có thể bị phủ nhận bằng cách đặt nó bên trong điều kiện `"not"` — điều này có nghĩa là, khi khớp, một liên kết _sẽ không_ có quy tắc speculation được áp dụng cho nó, nhưng khi _không_ khớp, nó _sẽ_. Ví dụ sau sẽ khiến tất cả các liên kết _không_ khớp với mẫu URL `/logout` có quy tắc được áp dụng cho chúng, nhưng không áp dụng cho các liên kết khớp với `/logout`:

```json
{ "where": { "not": { "href_matches": "/logout" } } }
```

#### Kết hợp nhiều điều kiện `"where"` với `"and"` hoặc `"or"`

Nhiều điều kiện có thể được kết hợp bên trong các điều kiện `"and"` hoặc `"or"` — chúng lấy giá trị của các mảng chứa nhiều điều kiện, tất cả hoặc bất kỳ (tương ứng) phải khớp để các speculation rules áp dụng cho một liên kết. Sử dụng `"and"` hoặc `"or"`, các điều kiện có thể được lồng nhau nhiều cấp — không có giới hạn được chỉ định về các cấp lồng nhau được phép.

Sẽ hữu ích khi nghĩ về đối tượng `"where"` như tương đương với một câu lệnh `if`. Vì vậy

```plain
{ and: [A, B, { or: [C, { not: D }] }] }
```

tương đương với

```plain
if (A && B && (C || !D)) {
  apply speculation rule
}
```

Trong ví dụ quy tắc speculation hoàn chỉnh sau, tất cả các trang cùng nguồn gốc được đánh dấu để prefetch ngoại trừ những trang được biết là có vấn đề — trang `/logout`, và bất kỳ liên kết nào được đánh dấu với class `.no-prerender`:

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "where": {
          "and": [
            { "href_matches": "/*" },
            { "not": { "href_matches": "/logout" } },
            { "not": { "selector_matches": ".no-prerender" } }
          ]
        }
      }
    ]
  }
</script>
```

> [!NOTE]
> Mẫu `where` ở trên không bao gồm các liên kết cross-site, được hỗ trợ cho prefetch (miễn là người dùng không có cookie được đặt cho trang đích, để bảo vệ chống lại theo dõi) nhưng không áp dụng cho prerender.

### Ví dụ `"relative_to"`

Đối với các tập quy tắc được lấy từ bên ngoài (tức là, qua response header {{httpheader("Speculation-Rules")}}), các URL trong quy tắc danh sách và mẫu URL trong quy tắc tài liệu được phân tích tương đối với URL tệp văn bản bên ngoài chứa theo mặc định. Để phân tích các URL trong quy tắc danh sách tương đối với URL cơ sở của tài liệu, `"relative_to"` được sử dụng như sau:

```json
{
  "urls": ["/home", "/about"],
  "relative_to": "document"
}
```

Đối với quy tắc tài liệu, `"relative_to"` có thể được ghép trực tiếp với `"href_matches"` và URL cơ sở của tài liệu sẽ chỉ được sử dụng cho các mẫu trong điều kiện cụ thể đó:

```json
{
  "where": {
    "or": [
      { "href_matches": "/home", "relative_to": "document" },
      { "href_matches": "/about" }
    ]
  }
}
```

Trong ví dụ trên, chỉ `"href_matches"` đầu tiên sẽ được khớp tương đối với URL cơ sở của tài liệu.

### Ví dụ `"expects_no_vary_search"`

Hãy xem xét trường hợp một trang đích thư mục người dùng, `/users`, có tham số `id` được thêm vào để hiển thị thông tin về một người dùng cụ thể, ví dụ `/users?id=345`. Liệu URL này có nên được coi là giống nhau cho mục đích lưu cache hay không phụ thuộc vào hành vi của ứng dụng.

Để giải quyết điều này, chúng ta có thể cung cấp gợi ý về giá trị `No-Vary-Search` mà tác giả trang mong đợi. Một quy tắc speculation có thể có trường `"expects_no_vary_search"`, chứa biểu diễn chuỗi của giá trị header mong đợi:

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "urls": ["/users"],
        "expects_no_vary_search": "params=(\"id\")"
      }
    ]
  }
</script>
<a href="/users?id=345">User Bob</a>
```

Điều này chỉ ra rằng máy chủ dự kiến sẽ tạo ra Lựa chọn 2. Nếu một điều hướng bắt đầu trong khi có một prefetch đang diễn ra của `/users`, điều này thông báo cho trình duyệt rằng việc chờ prefetch là phù hợp, thay vì ngay lập tức bắt đầu một fetch khác cho `/users?id=345`.

### Ví dụ `eagerness`

Tập quy tắc tài liệu sau đây cho thấy cách `eagerness` có thể được sử dụng để gợi ý về mức độ nhiệt tình khi trình duyệt nên prerender mỗi tập liên kết khớp.

```html
<script type="speculationrules">
  {
    "prerender": [
      {
        "where": { "href_matches": "/*" },
        "eagerness": "conservative"
      },
      {
        "where": { "selector_matches": ".product-link" },
        "eagerness": "eager"
      }
    ]
  }
</script>
```

Ở đây chúng ta đang gợi ý rằng:

- Tất cả các liên kết cùng nguồn gốc có trong tài liệu nên được prerender một cách thận trọng (tức là, khi người dùng bắt đầu kích hoạt chúng).
- Bất kỳ liên kết sản phẩm nào (trong trường hợp này, những liên kết có `class` là `.product-link`) trong tài liệu nên được prerender một cách nhiệt tình (tức là, nếu người dùng thực hiện bất kỳ hành động nào hướng tới việc điều hướng đến chúng).

### Ví dụ `tag`

Có thể bao gồm `tag` ở cấp cao nhất để xác định tập quy tắc tổng thể:

```html
<script type="speculationrules">
  {
    "tag": "my-rules",
    "prerender": [
      {
        "where": { "href_matches": "/*" },
        "eagerness": "conservative"
      }
    ]
  }
</script>
```

Hoặc để xác định các quy tắc riêng lẻ:

```html
<script type="speculationrules">
  {
    "prefetch": [
      "tag": "my-prefetch-rule",
      "urls": ["next.html"]
    ],
    "prerender": [
      "tag": "my-prerender-rule",
      "urls": ["next2.html"]
    ],
  }
</script>
```

Xem {{HTTPHeader("Sec-Speculation-Tags")}} để biết thêm ví dụ.

### Ví dụ `target_hint`

Có thể bao gồm `target_hint` để chỉ ra cửa sổ đích mà các suy đoán prerender khớp sẽ được mở:

```html
<script type="speculationrules">
  {
    "tag": "my-rules",
    "prerender": [
      {
        "eagerness": "eager",
        "target_hint": "_blank",
        "urls": ["page2.html"]
      }
    ]
  }
</script>
```

Các quy tắc trên cho phép các liên kết sau được prerender đúng trong các đích thích hợp:

```html
<a href="page1.html">Open link in this window</a>
<a target="_blank" href="page2.html">Open link in new window</a>
```

`target_hint` chỉ cần thiết cho các quy tắc danh sách, sử dụng `urls`.
Không cần thiết cho các quy tắc tài liệu (sử dụng `where`) vì trong các quy tắc này đích có thể biết được từ thuộc tính `target` của phần tử liên kết `<a>`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Prerender pages in Chrome for instant page navigations](https://developer.chrome.com/docs/web-platform/prerender-pages) trên developer.chrome.com
- [Tải đầu cơ](/en-US/docs/Web/Performance/Guides/Speculative_loading)
- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
