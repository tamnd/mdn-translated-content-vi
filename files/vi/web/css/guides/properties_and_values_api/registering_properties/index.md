---
title: Registering custom properties in CSS
slug: Web/CSS/Guides/Properties_and_values_API/Registering_properties
page-type: guide
sidebar: cssref
---

At-rule `@property`, một phần của tập API [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs), cho phép các nhà phát triển định nghĩa tường minh [CSS custom properties](/en-US/docs/Web/CSS/Reference/Properties/--*). Trong hướng dẫn này, chúng ta tìm hiểu cách sử dụng `@property` để kiểm tra kiểu và ràng buộc, đặt giá trị mặc định cho thuộc tính tùy chỉnh trong CSS, và định nghĩa xem thuộc tính tùy chỉnh có thể kế thừa giá trị hay không.

## Tại sao cần đăng ký thuộc tính tùy chỉnh?

CSS custom properties, thường được gọi là CSS variables, có thể được định nghĩa bằng cách khai báo cơ bản. Thông thường, chúng được khai báo trên {{cssxref(":root")}}, và có thể bị ghi đè bằng một giá trị khác trong các ruleset tiếp theo — bao gồm trong các quy tắc dựa trên trạng thái UI và trong container và media queries.

Trong ví dụ này, `--myColor` được gán giá trị `#bada55` trên `:root`, sau đó được đặt thành một giá trị khác trên `main`, được kế thừa bởi tất cả các phần tử con của `main`. Giá trị đó bị ghi đè khi `main` được di chuột qua hoặc khi viewport nhỏ hơn `750px`. Trong các phần tử có class `circles`, `--myColor` được đặt thành `45deg`, đây là một kiểu dữ liệu khác.

```css
:root {
  --myColor: #bada55;
}
main {
  --myColor: #cacaca;
}
main:hover {
  --myColor: #aabbbbaa;
}
@media (width < 750px) {
  main {
    --myColor: #aabbbbaa;
  }
}

.circles {
  --myColor: 45deg;
}
```

[CSS properties and values API](/en-US/docs/Web/CSS/Guides/Properties_and_values_API) cung cấp các phương thức đăng ký thuộc tính tùy chỉnh. Việc đăng ký CSS custom properties thiết lập kiểu, kế thừa và giá trị mặc định của biến, làm cho chúng dễ dự đoán hơn và có hiệu năng tốt hơn.

Các thuộc tính đã đăng ký được xác thực khi chúng được tính toán thay vì khi chúng được phân tích cú pháp. Điều này có nghĩa là:

- Các giá trị không hợp lệ sẽ không xuất hiện là không hợp lệ khi kiểm tra các thuộc tính của phần tử.
- Một thuộc tính không hợp lệ được đưa vào sau một thuộc tính hợp lệ sẽ không rơi về thuộc tính hợp lệ. Tuy nhiên, một thuộc tính không hợp lệ sẽ rơi về giá trị mặc định đã đăng ký của nó.

Theo mặc định, tất cả CSS variables đều kế thừa. Khi bạn thay đổi giá trị biến chưa đăng ký, trình duyệt phân tích lại DOM để kiểm tra các phần tử nào trong cây DOM bị ảnh hưởng. Với các thuộc tính đã đăng ký, việc đặt giá trị `inherits: false;` báo cho trình duyệt biết rằng, nếu giá trị thay đổi, các phần tử con không cần phân tích lại, thu hẹp phạm vi tính toán lại style.

Nhìn chung, bạn sẽ muốn đăng ký thuộc tính tùy chỉnh nếu bạn đang animation biến, thực hiện kiểm tra kiểu, hoặc đảm bảo hành vi kế thừa có thể dự đoán được. Nếu bạn đang tạo một CSS framework, hãy đặt tên và đăng ký các thuộc tính tùy chỉnh để đảm bảo chúng luôn có giá trị mặc định, và ngăn người dùng framework gán các kiểu dữ liệu không hợp lệ cho chúng nếu họ thay đổi giá trị.

Trong CSS, các thuộc tính được đăng ký bằng at-rule `@property`. Trong ví dụ này, `--myColor` được đăng ký toàn cục là màu có thể kế thừa với giá trị `#bada55`, và được sử dụng trong `main` khi di chuột qua. Việc đăng ký cải thiện hiệu năng animation vì giá trị có kiểu chính xác, và trình duyệt không cần phân tích cú pháp giá trị trước khi animation nó. Phép gán `.circles` bị bỏ qua vì kiểu dữ liệu của thuộc tính được đăng ký là `<color>`, không phải `<angle>`.

```css
@property --myColor {
  syntax: "<color>";
  inherits: true;
  initial-value: #bada55;
}

main:hover {
  color: var(--myColor);
  animation: colorChange 2s linear forwards;
}

@keyframes colorChange {
  to {
    color: red;
  }
}

.circles {
  --myColor: 45deg;
}
```

## @property và các descriptors

Quy tắc `@property` cho phép đăng ký thuộc tính tùy chỉnh trực tiếp bên trong stylesheet mà không cần JavaScript. Các quy tắc `@property` hợp lệ tạo ra các thuộc tính tùy chỉnh đã đăng ký, tạo ra hiệu ứng tương tự như việc gọi {{domxref('CSS.registerProperty_static', 'registerProperty()')}} với các tham số tương đương.

Tên thuộc tính tùy chỉnh là một {{cssxref("dashed-ident")}} bắt đầu bằng `--` và tiếp theo là một định danh hợp lệ do người dùng tự định nghĩa. Tên này phân biệt chữ hoa chữ thường. Khai báo bao gồm tối đa ba descriptors: {{cssxref("@property/syntax","syntax")}}, {{cssxref("@property/inherits","inherits")}} và {{cssxref("@property/initial-value","initial-value")}}.

Trong ví dụ này, chúng ta tạo thuộc tính tùy chỉnh `--rotation`.

```css
@property --rotation {
  syntax: "<angle>";
  inherits: false;
  initial-value: 45deg;
}
```

### Các descriptors của @property

Để quy tắc `@property` hợp lệ, nó phải bao gồm cả hai descriptor {{cssxref("@property/syntax","syntax")}} và {{cssxref("@property/inherits","inherits")}}. Descriptor {{cssxref("@property/initial-value","initial-value")}} là tùy chọn.

- `syntax`
  - : Descriptor {{cssxref("@property/syntax","syntax")}} là một chuỗi mô tả các kiểu giá trị được phép cho thuộc tính tùy chỉnh đã đăng ký. Giá trị của descriptor có thể là tên kiểu dữ liệu, như `<color>`, `<length>`, hoặc `<number>`, với các multiplier (`+`, `#`) và combinator (`|`), hoặc một ident tùy chỉnh. Trong ví dụ của chúng ta, thuộc tính `--rotation` được đặt thành `<angle>`, nghĩa là nó chỉ có thể được gán giá trị {{cssxref("angle")}}.

- `inherits`
  - : Descriptor {{cssxref("@property/inherits","inherits")}} là một giá trị {{glossary("boolean")}} kiểm soát xem thuộc tính tùy chỉnh có kế thừa theo mặc định hay không: đặt thành `true` để kế thừa, `false` để không kế thừa. Xem phần [Đăng ký và sử dụng thuộc tính tùy chỉnh](#registering_and_using_custom_properties) để xem ví dụ cho cả hai giá trị.

- `initial-value`
  - : At-rule `@property` cũng chấp nhận descriptor {{cssxref("@property/initial-value","initial-value")}}. Giá trị này xác định giá trị bắt đầu cho thuộc tính. Descriptor này chỉ là tùy chọn khi giá trị của descriptor `syntax` là định nghĩa syntax phổ quát (tức là, `syntax: "*"`). Nếu syntax có bất kỳ giá trị nào khác, nó là bắt buộc và phải là giá trị _độc lập về mặt tính toán_, nghĩa là giá trị không thể thuộc kiểu dữ liệu phụ thuộc vào giá trị khác, như các giá trị có đơn vị `%` hoặc `em`.

Nếu thiếu descriptor `syntax` hoặc `inherits`, toàn bộ quy tắc `@property` là không hợp lệ và bị bỏ qua. Nếu descriptor `initial-value` là bắt buộc nhưng bị bỏ qua, toàn bộ quy tắc `@property` là không hợp lệ và bị bỏ qua. Các descriptor không xác định là không hợp lệ và bị bỏ qua, nhưng không làm mất hiệu lực quy tắc `@property`.

## Đăng ký và sử dụng thuộc tính tùy chỉnh

Trong ví dụ này, chúng ta sẽ định nghĩa hai thuộc tính tùy chỉnh: `--item-size` và `--item-color`. Sau đó chúng ta sẽ sử dụng các thuộc tính tùy chỉnh này để định nghĩa kích thước (chiều rộng và chiều cao) và màu nền của ba mục sau đây.

```html
<div class="container">
  <div class="item one">Item one</div>
  <div class="item two">Item two</div>
  <div class="item three">Item three</div>
</div>
```

Ở đây chúng ta dùng at-rule CSS `@property` để định nghĩa thuộc tính tùy chỉnh `--item-size`. Chúng ta đặt giá trị ban đầu là `40%` và giới hạn các giá trị hợp lệ chỉ là giá trị {{cssxref("percentage")}}. Điều này có nghĩa là khi thuộc tính này được dùng để định kích thước phần tử, kích thước của phần tử luôn tương đối với kích thước của cha nó. Thuộc tính này có thể kế thừa.

```css
@property --item-size {
  syntax: "<percentage>";
  inherits: true;
  initial-value: 40%;
}
```

Bạn cũng có thể dùng [JavaScript](/en-US/docs/Web/JavaScript) để đăng ký thuộc tính. Phương thức {{domxref('CSS.registerProperty_static', 'CSS.registerProperty()')}} của JavaScript tương đương với at-rule `@property`. Ở đây chúng ta định nghĩa thuộc tính tùy chỉnh thứ hai, `--item-color`, có giá trị ban đầu là `aqua`, chỉ chấp nhận giá trị {{cssxref("&lt;color&gt;")}}, và không được kế thừa.

```js
window.CSS.registerProperty({
  name: "--item-color",
  syntax: "<color>",
  inherits: false,
  initialValue: "aqua",
});
```

Xem [Hướng dẫn JavaScript API về đăng ký thuộc tính tùy chỉnh](/en-US/docs/Web/API/CSS_Properties_and_Values_API/guide) để biết thêm thông tin.

### Sử dụng thuộc tính tùy chỉnh đã đăng ký

Chúng ta có thể gán giá trị mới cho các thuộc tính đã đăng ký. Ở đây, chúng ta đặt giá trị thuộc tính tùy chỉnh trên container cha, sau đó đặt giá trị thuộc tính tùy chỉnh trên chính các mục. Các giá trị được đặt trên `two` là hợp lệ trong khi các giá trị được đặt trên `three` là không hợp lệ.

```css
.container {
  --item-size: 20%;
  --item-color: orange;
}
.two {
  --item-size: initial;
  --item-color: inherit;
}
.three {
  --item-size: 1000px;
  --item-color: xyz;
}
```

Chúng ta dùng hai thuộc tính tùy chỉnh làm giá trị cho các thuộc tính {{cssxref("width")}}, {{cssxref("height")}} và {{cssxref("background-color")}} của các mục:

```css
.item {
  width: var(--item-size);
  height: var(--item-size);
  background-color: var(--item-color);
}
```

```css hidden
.container {
  display: flex;
  height: 200px;
  border: 1px dashed black;
}
```

{{ EmbedLiveSample('Registering and using custom properties', '100%', '250px') }}

### Kế thừa

Descriptor `inherits` kiểm soát xem thuộc tính tùy chỉnh CSS đã đăng ký có kế thừa theo mặc định hay không.

Trong ví dụ của chúng ta, thuộc tính kích thước được đặt là có thể kế thừa; còn màu sắc thì không. Hai thuộc tính tùy chỉnh, `--item-size: 20%` và `--item-color: orange;` được đặt trên cha `container`, ghi đè các giá trị mặc định `40%` và `aqua` được đặt khi các thuộc tính tùy chỉnh này được định nghĩa.

Đối với mục một, không có thuộc tính tùy chỉnh nào được đặt. Vì `--item-size` có thể kế thừa, giá trị `20%` được đặt trên cha `container` đã được kế thừa và sử dụng. Thuộc tính `--item-color` không thể kế thừa, vì vậy giá trị `orange` được đặt trên cha không được xem xét. Thay vào đó, giá trị ban đầu mặc định `aqua` được sử dụng.

Descriptor `inherits` là bắt buộc; nếu thiếu hoặc không hợp lệ, toàn bộ quy tắc `@property` sẽ không hợp lệ và bị bỏ qua.

### Giá trị hợp lệ và không hợp lệ

Một lợi ích của việc đăng ký thuộc tính tùy chỉnh (so với việc dùng khai báo đơn giản) là chúng có thể được đặt chỉ với các giá trị hợp lệ. Descriptor `syntax` xác định giá trị nào là hợp lệ. Bất kỳ khai báo nào có giá trị không đáp ứng các ràng buộc đó sẽ bị bỏ qua.

Đối với mục hai, các từ khóa toàn cục CSS được đặt cho cả hai thuộc tính tùy chỉnh. Các giá trị từ khóa toàn cục CSS — {{cssxref("initial")}}, {{cssxref("inherit")}}, {{cssxref("unset")}}, {{cssxref("revert")}} và {{cssxref("revert-layer")}} — là các giá trị hợp lệ cho tất cả các kiểu giá trị và do đó hợp lệ bất kể giá trị descriptor `syntax`. `--item-size` được đặt thành `initial` và do đó sử dụng `initial-value: 40%;` được đặt trong khai báo `@property`. `--item-color` được đặt thành `inherit`, kế thừa tường minh giá trị `orange` từ cha ngay cả khi thuộc tính tùy chỉnh được đặt để không kế thừa. Đó là lý do tại sao mục hai có màu cam.

Đối với mục ba, giá trị `--item-size` được đặt thành `1000px`. Mặc dù `1000px` là giá trị {{cssxref("length")}}, khai báo `@property` yêu cầu giá trị phải là `<percentage>`, vì vậy khai báo không hợp lệ và bị bỏ qua, nghĩa là giá trị `20%` có thể kế thừa được đặt trên cha được sử dụng. Giá trị `xyz` cũng không hợp lệ. Vì `registerProperty()` đặt `--item-color` là không kế thừa, giá trị ban đầu mặc định là `aqua` được sử dụng và không phải giá trị `orange` của cha.

### Animation giá trị thuộc tính tùy chỉnh

Các CSS custom properties đã đăng ký mang lại lợi thế về hiệu năng vì chúng được coi là dữ liệu có kiểu thay vì chuỗi, cung cấp cho rendering engine của trình duyệt cú pháp được xác định và các quy tắc kế thừa. Trình duyệt phân tích cú pháp được định nghĩa một lần; khi biến đó được sử dụng ở nơi khác, kiểu và biểu diễn nội bộ đã được biết, vì vậy không cần phân tích lại.

Vì các thuộc tính tùy chỉnh chưa đăng ký chỉ là chuỗi, trình duyệt không thể {{glossary("interpolation", "nội suy")}} chúng, nên không thể animation chúng một cách mượt mà. Thay vào đó, các giá trị thuộc tính tùy chỉnh chưa đăng ký được animation một cách rời rạc. Các biến đã đăng ký có thể được nội suy và do đó được animation; các phép tính nội suy của chúng được đưa sang GPU, hiệu năng tốt hơn so với các animation được thực hiện trên main thread.

Xem [Animating a custom property value](/en-US/docs/Web/CSS/Reference/At-rules/@property#animating_a_custom_property_value) để xem ví dụ animation.

## Xem thêm

- {{cssxref("var()")}}
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
- [Using CSS custom properties (variables)](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) guide
- [CSS Properties and Values API](/en-US/docs/Web/CSS/Guides/Properties_and_values_API) module
- [CSS Properties and Values](/en-US/docs/Web/API/CSS_Properties_and_Values_API) API
- [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables) module
