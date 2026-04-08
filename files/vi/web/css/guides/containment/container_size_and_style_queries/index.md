---
title: Using container size and style queries
slug: Web/CSS/Guides/Containment/Container_size_and_style_queries
page-type: guide
sidebar: cssref
---

[Container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries) cho phép bạn áp dụng các kiểu dáng cho các phần tử lồng nhau bên trong một container cụ thể dựa trên các tính năng của container đó. Query trả về true hoặc false tùy thuộc vào việc điều kiện query có đúng với container hay không.

Container queries tương tự như [media queries](/en-US/docs/Web/CSS/Guides/Media_queries). At-rule {{cssxref("@media")}} cho phép áp dụng các kiểu dáng cho các phần tử dựa trên kích thước viewport hoặc các đặc điểm thiết bị khác. Tương tự, at-rule {{cssxref("@container")}} cho phép áp dụng các kiểu dáng cho các phần tử dựa trên kích thước hoặc các tính năng style khác của phần tử chứa, thay vì viewport. Container queries có cùng quy tắc cú pháp và toán tử logic như media queries.

```css
@container <container-condition># {
  /* <stylesheet> */
}
```

Có ba loại container queries:

- **Container size queries**
  - : Size queries cho phép áp dụng các kiểu dáng cho các phần tử dựa trên [kích thước](/en-US/docs/Web/CSS/Reference/At-rules/@container#descriptors) hiện tại của phần tử chứa, bao gồm hướng và {{glossary("aspect ratio")}}. Các phần tử chứa cần được khai báo rõ ràng là _size query containers_.

- **[Container style queries](/en-US/docs/Web/CSS/Reference/At-rules/@container#container_style_queries)**
  - : Style queries cho phép áp dụng các kiểu dáng cho các phần tử dựa trên các tính năng style của phần tử chứa, trong đó bất kỳ phần tử nào không rỗng đều có thể là style query container. Tính năng style có thể là thuộc tính CSS, [custom property](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) CSS, hoặc một [declaration](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_declarations) CSS hợp lệ.
    Điều này cho phép bạn áp dụng kiểu dáng cho các phần tử con của bất kỳ phần tử container nào dựa trên các tính năng style của nó — chẳng hạn như liệu nó có khai báo `display: inline` flex hay không, hoặc giá trị của một custom property.

- **[Container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)**
  - : Scroll-state queries cho phép bạn áp dụng có chọn lọc các quy tắc CSS cho các phần tử con của container dựa trên các điều kiện trạng thái cuộn, chẳng hạn như liệu phần tử được query có bị cuộn một phần hay không hoặc liệu container có bị snap vào scroll snap container hay không. Các phần tử chứa cần được khai báo rõ ràng là _scroll-state query containers_.

Trong hướng dẫn này, chúng ta tìm hiểu những kiến thức cơ bản về container queries bằng cách xem xét:

1. [container size queries](#container_size_queries_2),
2. [đặt tên containers](#naming_containers) để giới hạn phạm vi của chúng, và
3. sử dụng ký hiệu hàm `style()` trong `<container-condition>` của at-rule {{cssxref("@container")}} để tạo [style queries với custom properties](#style_queries_for_custom_properties).

Scroll-state queries được thảo luận trong [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries).

## Container size queries

Container size queries được lọc theo điều kiện kích thước. Các kiểu dáng được liên kết sẽ được áp dụng cho các phần tử con nếu phần tử container đã được khai báo là một container và điều kiện container là đúng với phần tử đó. Size container của một phần tử là ancestor gần nhất có containment.

Các phần tử được khai báo là _size query containers_ bằng cách đặt thuộc tính {{cssxref("container-type")}} (hoặc viết tắt {{cssxref("container")}}) thành `size` hoặc `inline-size`.

```css
@container (orientation: landscape) {
  /* kiểu dáng được áp dụng cho các phần tử con của size container này */
}

.sizeContainer {
  container-type: size;
}
```

Việc khai báo size query containers sẽ thêm [containment](/en-US/docs/Web/CSS/Guides/Containment/Using) vào chúng. Đây là một yêu cầu về hiệu suất — việc query kích thước của mỗi phần tử trong DOM mọi lúc sẽ làm giảm hiệu suất và trải nghiệm người dùng. Ngoài ra, nếu style của phần tử con thay đổi kích thước của phần tử container, một vòng lặp vô hạn có thể xảy ra.

Trong một container size query, `<container-condition>` bao gồm một hoặc nhiều `<size-query>`. Mỗi size query bao gồm tên tính năng kích thước, toán tử so sánh, và một giá trị. Các tính năng kích thước có thể được query giới hạn ở `width`, `height`, `inline-size`, `block-size`, `aspect-ratio`, và `orientation`. Cú pháp boolean và logic kết hợp một hoặc nhiều `<size-query>` giống như với {{cssxref("@media")}} size feature queries.

```css
form {
  container-type: inline-size;
}

@container (10em <= width <= 20em) {
  /* styles */
}
```

`<container-condition>` trong ví dụ này chứa một `<size-query>` duy nhất — `(10em <= width <= 20em)`. Trong trường hợp này, tất cả các phần tử {{htmlelement("form")}} đều là các đối tượng tiềm năng cho bất kỳ unnamed container query nào. Các kiểu dáng được khai báo trong container query của chúng ta áp dụng cho các phần tử con của tất cả các form có chiều rộng từ `10em` đến `30em`, bao gồm.

## Đặt tên containers

Một `<container-condition>` có thể bao gồm một {{cssxref("container-name")}} phân biệt hoa thường tùy chọn. Tên container làm cho điều kiện container cụ thể hơn — nó chỉ được đánh giá so với các phần tử có tên đó được đặt trong thuộc tính `container-name`.

Thuộc tính {{cssxref("container-name")}} xác định danh sách các giá trị `<container-name>` query có thể được sử dụng trong các quy tắc `@container`; đây là các giá trị {{cssxref("ident")}} phân biệt hoa thường. Tên container cho phép nhắm đến bất kỳ container ancestor nào của phần tử. Không có tên container, query chỉ khớp với container ancestor gần nhất.

```css
@container [ [ <container-name> ]? <container-query> ]# {
  /* <stylesheet> */
}
```

Sau khi bạn thêm tên vào các at-rule `@container`, bạn có thể sử dụng thuộc tính {{cssxref("container-name")}} hoặc viết tắt {{cssxref("container")}} để nhắm đến các phần tử container cụ thể. Các kiểu dáng bên trong các at-rule `@container` có tên sẽ chỉ được áp dụng cho các phần tử phù hợp bên trong các container có tên đó được đặt, thỏa mãn container queries.

```css
@container card (orientation: landscape) {
  /* styles */
}

.todo-panel > li {
  container-type: inline-size;
  container-name: card;
}
```

Trong ví dụ trên, các kiểu dáng trong khối container query sẽ áp dụng cho các phần tử con của tất cả các phần tử {{htmlelement("li")}} có chiều rộng lớn hơn chiều cao của chúng. Lưu ý rằng các phần tử khác có `container-name: card` được áp dụng và khớp với size query cũng sẽ có các kiểu dáng này được áp dụng cho các phần tử con của chúng.

```css
@container wide (width >= 20em) {
  /* kiểu dáng được áp dụng cho các phần tử con của .sizeContainer rộng */
}

@container narrow (width < 20em) {
  /* kiểu dáng được áp dụng cho các phần tử con của .sizeContainer hẹp */
}

.sizeContainer {
  container-type: size;
  container-name: wide narrow;
}
```

Trong ví dụ trên, phần tử có hai tên container, `wide` và `narrow`. Các phần tử con của bất kỳ phần tử nào có `class="sizeContainer"` sẽ nhận các kiểu dáng từ query `wide` hoặc `narrow` được áp dụng.

Giá trị mặc định `container-type: normal` ngăn container trở thành size container, nhưng nó vẫn có thể là [style container](#container_style_queries). Giá trị mặc định `container-name: none` cho biết container không có tên, nhưng không ngăn phần tử khớp với các unnamed queries.

Với container queries, chúng ta không bị giới hạn ở size queries! Bạn cũng có thể query các tính năng style của container.

## Container style queries

Một _container style query_ là một `@container` query đánh giá các computed styles của phần tử container như được định nghĩa trong một hoặc nhiều ký hiệu hàm `style()`. Cú pháp boolean và logic được sử dụng để kết hợp các tính năng style thành một style query giống như trong [CSS feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries). Sự khác biệt duy nhất là tên hàm — `style()` trong một `<style-feature>` so với `supports()` trong một `<support-condition>`:

```css
@container style(<style-feature>),
    not style(<style-feature>),
    style(<style-feature>) and style(<style-feature>),
    style(<style-feature>) or style(<style-feature>) {
  /* <stylesheet> */
}
```

Tham số của mỗi hàm `style()` là một **`<style-feature>`** duy nhất. Theo đặc tả CSS containment, một `<style-feature>` có thể là một [declaration](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_declarations) CSS hợp lệ, một thuộc tính CSS, hoặc một [`<custom-property-name>`](/en-US/docs/Web/CSS/Reference/Values/var#values). Tính năng style duy nhất hiện được hỗ trợ là custom properties, có hoặc không có giá trị. Xem [bảng tương thích trình duyệt cho `@container`](/en-US/docs/Web/CSS/Reference/At-rules/@container#browser_compatibility).

Nếu `<style-feature>` bao gồm một giá trị, style query đánh giá là true nếu computed value của custom property (hoặc, trong tương lai, CSS declaration) được truyền vào như tham số `style()` là true cho container đang được query. Ngược lại, nó giải quyết thành false.
Một tính năng style không có giá trị đánh giá là true nếu computed value khác với [initial value](#registered_properties) cho thuộc tính đã cho.

Trong tương lai, chúng ta sẽ có thể viết style queries như sau:

```css
@container style(color: green) and style(background-color: transparent),
    not style(background-color: red),
    style(--themeBackground),
    style(--themeColor: blue) or style(--themeColor: purple),
    (width <= 100vw) and style(max-width: 600px) {
  /* <stylesheet> */
}
```

Ký hiệu hàm `style()` được sử dụng để phân biệt style queries với size queries. Mặc dù chưa được hỗ trợ, cuối cùng chúng ta sẽ có thể query các CSS declarations thông thường như `max-width: 600px`. Query `@container (max-width: 600px)` là một size query; containment với {{cssxref("container-type")}}, hoặc viết tắt {{cssxref("container")}}, là cần thiết. Query đó sẽ trả về true nếu container nhỏ hơn hoặc bằng 600px. Điều đó khác với việc query `@container style(max-width: 600px)`, là một style query; khi được hỗ trợ, query này sẽ trả về true nếu container có giá trị {{cssxref("max-width")}} là `600px`.

Cho đến khi style queries cho các CSS declarations và properties thông thường được hỗ trợ, chúng ta bị giới hạn chỉ bao gồm custom properties như tham số `style()`, có hoặc không có giá trị:

```css
@container style(--themeBackground),
    style(--themeColor: blue) or style(--themeColor: purple) {
  /* <stylesheet> */
}
```

Một vài điều cần lưu ý đã được đề cập nhưng quan trọng cần nhớ:

- Tất cả các phần tử đều có thể là style query containers; không cần thiết phải đặt `container-type`. Khi các kiểu dáng phần tử con không ảnh hưởng đến computed styles của ancestor, containment là không cần thiết.
- Một `<container-condition>` có thể bao gồm cả tính năng style và kích thước. Nếu bao gồm tính năng kích thước trong query của bạn, hãy đảm bảo các phần tử container của bạn có `container-type` là `size` hoặc `inline-size`.
- Nếu bạn không muốn một phần tử bao giờ được coi là container, hãy đặt cho nó một `container-name` sẽ không được sử dụng. Đặt `container-name: none` xóa tất cả tên query liên kết với một container; nó không ngăn phần tử trở thành style container.
- Tính đến thời điểm viết bài này (tháng 2 năm 2024), container style queries chỉ hoạt động với các giá trị CSS custom property trong `style()` query.

Bây giờ, hãy đi sâu và xem xét các loại `<style-feature>` khác nhau.

### Style queries cho custom properties

Style queries cho custom properties cho phép bạn query các [custom properties](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties), còn gọi là "CSS variables", của phần tử cha. Chúng được đưa vào `<style-query>` giống như bạn sẽ đưa bất kỳ thuộc tính CSS thông thường nào vào một feature query: có hoặc không có giá trị.

#### Standalone custom property queries

Tham số `<style-query>` của ký hiệu hàm `style()` có thể chỉ bao gồm tên biến CSS; một custom property không có giá trị. Khi không có giá trị, query sẽ trả về false nếu giá trị giống với giá trị của descriptor `initial-value` trong at-rule `@property`, nếu có. Style query sẽ trả về true và khớp với tất cả các phần tử có giá trị custom property khác với `initial-value` hoặc với tất cả các phần tử có custom property với bất kỳ giá trị nào nếu custom property được khai báo mà không được đăng ký.

##### Unregistered custom properties

Khi các CSS variables được giới thiệu thông qua gán giá trị CSS custom property, valueless custom property queries luôn trả về true.

```css
:root {
  --theme-color: rebeccapurple;
}

@container style(--theme-color) {
  /* <stylesheet> */
}
```

Trong ví dụ này, container query khớp với phần tử mà thuộc tính `--theme-color` được khai báo và tất cả các phần tử con của nó. Vì CSS variable `--theme-color` được khai báo trên {{cssxref(":root")}}, style query `style(--theme-color)` sẽ là true cho mọi phần tử trong {{glossary("DOM")}} node đó.

##### Registered properties

Hành vi của registered custom properties khác nhau. Khi được định nghĩa rõ ràng bằng CSS at-rule {{cssxref("@property")}} hoặc thông qua JavaScript với {{domxref('CSS/registerProperty_static', 'CSS.registerProperty()')}}, style query `style(--theme-color)` chỉ trả về true cho các phần tử nếu computed value của phần tử cho `--theme-color` khác với [`initial-value`](/en-US/docs/Web/CSS/Reference/At-rules/@property/initial-value) được đặt trong định nghĩa gốc của custom property đó.

```css
@property --theme-color {
  initial-value: rebeccapurple;
  inherits: true;
}

:root {
  --theme-color: rebeccapurple;
}

main {
  --theme-color: blue;
}

@container style(--theme-color) {
  /* <stylesheet> */
}
```

Trong ví dụ này, phần tử `:root` KHÔNG khớp với style query vì giá trị của custom property giống với giá trị `initial-value`. Giá trị custom property cho phần tử (và tất cả các phần tử kế thừa giá trị) vẫn là `rebeccapurple`. Chỉ các phần tử khác với initial value, trong trường hợp này là {{htmlelement("main")}} và các phần tử con của nó kế thừa giá trị đã thay đổi đó, mới là kết quả khớp.

#### Custom property với một giá trị

Nếu một style query bao gồm một giá trị cho custom property, computed value của phần tử cho thuộc tính đó phải khớp chính xác, với các giá trị tương đương chỉ là kết quả khớp nếu custom property được định nghĩa bằng at-rule {{cssxref("@property")}} (hoặc cuộc gọi phương thức {{domxref('CSS/registerProperty_static', 'CSS.registerProperty()')}}) chứa một `syntax` descriptor.

```css
@container style(--accent-color: blue) {
  /* <stylesheet> */
}
```

Container style query này khớp với bất kỳ phần tử nào có `blue` là [computed value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của custom property `--accent-color`.

Trong trường hợp này, các giá trị màu khác tương đương với sRGB `blue` (chẳng hạn như mã hexadecimal `#0000ff`) sẽ chỉ khớp nếu thuộc tính `--accent-color` được định nghĩa là một màu với `@property` hoặc `CSS.registerProperty()`, ví dụ:

```css
@property --accent-color {
  syntax: "<color>";
  inherits: true;
  initial-value: #0000ff;
}
```

Trong trường hợp này, nếu giá trị của `--accent-color` được đặt thành `blue`, `#00f`, `#0000ff`, `rgb(0 0 255 / 1)`, hoặc `rgb(0% 0% 100%)` thì sẽ trả về true cho `@container style(--accent-color: blue)`.

##### Ví dụ

Trong ví dụ này, chúng ta có một {{htmlelement("fieldset")}} với bốn radio buttons. Tùy chọn thứ tư bao gồm một {{htmlelement("input")}} văn bản để nhập màu tùy chỉnh.

```html
<form>
  <fieldset>
    <legend>Change the value of <code>--theme</code></legend>
    <ol>
      <li>
        <input type="radio" name="selection" value="red" id="red" />
        <label for="red">--theme: red;</label>
      </li>
      <li>
        <input type="radio" name="selection" value="green" id="green" />
        <label for="green">--theme: green</label>
      </li>
      <li>
        <input type="radio" name="selection" value="blue" id="blue" />
        <label for="blue">--theme: blue</label>
      </li>
      <li>
        <input type="radio" name="selection" value="currentColor" id="other" />
        <label for="other">Other</label>
        <label for="color">color:</label>
        <input
          text="checkbox"
          name="selection-value"
          value="currentColor"
          id="color" />
      </li>
    </ol>
  </fieldset>
  <output>I change colors</output>
</form>
```

JavaScript cập nhật giá trị của CSS variable `--theme` trên phần tử {{htmlelement("body")}}, là ancestor của các phần tử {{htmlelement("fieldset")}} và {{htmlelement("output")}}, bất cứ khi nào một radio button được chọn. Khi text `<input>` được cập nhật, {{domxref("HTMLInputElement.value", "value")}} của radio button `other` được cập nhật chỉ khi radio button `other` được chọn, điều này lần lượt cập nhật giá trị của `--theme`.

```js
const radios = document.querySelectorAll('input[name="selection"]');
const body = document.querySelector("body");
const other = document.getElementById("other");
const color = document.getElementById("color");

for (const radio of radios) {
  radio.addEventListener("change", (e) => {
    body.style.setProperty("--theme", e.target.value);
  });
}
color.addEventListener("input", (e) => {
  other.style.setProperty("value", e.target.value);
  if (other.checked) {
    body.style.setProperty("--theme", e.target.value);
  }
});
```

Chúng ta sử dụng at-rule `@property` để định nghĩa CSS variable `--theme` là giá trị {{cssxref("color_value", "&lt;color&gt;")}} và đặt `initial-value` thành `red`, đảm bảo các màu tương đương là kết quả khớp bất kể cú pháp nào được sử dụng (ví dụ: `red` bằng `rgb(255 0 0)`, `#ff0000`, và `#f00`).

```css
@property --theme {
  syntax: "<color>";
  inherits: true;
  initial-value: red;
}
```

```css hidden
output {
  padding: 3px 5px;
  margin-top: 5px;
}
```

Style feature query đầu tiên là một custom property không có giá trị. Loại query này trả về true khi computed value cho giá trị custom property khác với `initial-value` cho thuộc tính đó. Trong trường hợp này, nó sẽ là true khi giá trị của `--theme` là bất kỳ giá trị nào khác ngoài bất kỳ giá trị tương đương cú pháp nào của `red` (chẳng hạn như `#ff0000`). Khi true, {{htmlelement("output")}} sẽ có một đường viền chấm 5px. Màu outline là giá trị hiện tại của `--theme`. Màu văn bản mặc định là xám.

```css
@container style(--theme) {
  output {
    outline: 5px dotted var(--theme);
    color: #777777;
  }
}
```

Style queries thứ hai và thứ ba bao gồm các giá trị cho custom property. Chúng sẽ khớp nếu giá trị `--theme` của container là màu tương đương với giá trị được liệt kê, ngay cả khi giá trị đó giống với `initial-value`. Query đầu tiên khớp với các phần tử có giá trị `--theme` tương đương với `red`, `blue`, hoặc `green`. Khi đó, {{cssxref("color")}} sẽ là giá trị hiện tại màu của `--theme` (trong trường hợp `blue` và `green`, ghi đè màu xám được đặt trong style query đầu tiên).

Style query thứ hai cho biết khi `--theme` tương đương với `red`, nội dung `<output>` cũng sẽ in đậm. Chúng ta đã làm điều này để minh họa rõ hơn rằng container query là kết quả khớp.

```css
@container style(--theme: green) or style(--theme: blue) or style(--theme: red) {
  output {
    color: var(--theme);
  }
}

@container style(--theme: red) {
  output {
    font-weight: bold;
  }
}
```

{{EmbedLiveSample('example','100%','200')}}

Hãy thử nhập các giá trị màu khác nhau vào text box. Bạn có thể nhận thấy rằng các giá trị là tương đương sRGB của `red` sẽ làm `<output>` có màu đỏ — vì nó khớp `style(--theme: red)` — trong khi xóa outline, vì `style(--theme)` trả về false nếu giá trị của phần tử cho `--theme` giống với initial value cho `--theme` được định nghĩa bởi at-rule `@property`. Bất kỳ giá trị màu sRGB hợp lệ không phải red nào, bao gồm `currentColor` hoặc `hsl(180 100% 50%)`, v.v., làm cho style query đầu tiên trả về true; chúng là các giá trị khác với `initial-value`.

Vì chúng ta đặt `syntax: "<color>";`, CSS variable chỉ có thể được gán các giá trị `<color>` hợp lệ. Các giá trị hợp lệ cho thuộc tính {{cssxref("color")}} không phải giá trị `<color>`, chẳng hạn như `unset` hoặc `inherit`, là [không hợp lệ](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling) cho custom property này và sẽ bị bỏ qua.

Nếu bạn nhập `unset` hoặc `gibberish`, JavaScript cập nhật `style` trên {{HTMLElement("body")}} thành `--theme: unset` hoặc `--theme: gibberish`. Cả hai đều không phải là màu. Cả hai đều không hợp lệ và bị bỏ qua. Điều này có nghĩa là initial value được kế thừa và không thay đổi, với `style(--theme)` trả về false và `style(--theme: red)` trả về true.

> [!NOTE]
> Khi khai báo custom properties, hãy cân nhắc sử dụng `@property` với descriptor {{cssxref("@property/syntax","syntax")}} để trình duyệt có thể so sánh đúng các computed values.

### Nested queries

Container queries có thể được lồng nhau trong các container queries khác. Các kiểu dáng được định nghĩa bên trong nhiều container queries lồng nhau được áp dụng khi tất cả các container queries bao bọc đều là true.

```css
@container style(--theme: red) {
  output {
    outline: 1px dotted;
  }
  @container style(--theme: purple) {
    output {
      outline: 5px dotted;
    }
  }
}
```

Trong trường hợp này, `<output>` sẽ có đường viền chấm 5px nếu nó được lồng trong một container có `--theme: purple` được đặt, và container đó được lồng trong một container có giá trị `--theme` là `red`.

### Style query CSS declarations và properties

Chưa được hỗ trợ trong bất kỳ trình duyệt nào, ký hiệu hàm `style()` có thể bao gồm các CSS declarations thông thường bao gồm các CSS properties và cặp property-value.

```css
@container style(font-weight: bold) {
  b,
  strong {
    background: yellow;
  }
}
```

Khi được hỗ trợ, ví dụ cơ bản này sẽ làm cho màu nền của bất kỳ phần tử {{htmlelement("b")}} và {{htmlelement("strong")}} nào có màu vàng khi phần tử cha đã là `bold`.

Việc khớp được thực hiện dựa trên computed value của container cha; nếu computed {{cssxref("font-weight")}} của cha là `bold` (không phải `bolder` hoặc `900`), sẽ có kết quả khớp. Giống như với container style queries cho custom properties, chúng ta không cần định nghĩa bất kỳ phần tử nào là style containers vì tất cả các phần tử đều là style containers theo mặc định. Miễn là một phần tử không có `container-name` được đặt, nếu nó có `font-weight: bold` được đặt hoặc kế thừa, nó sẽ khớp.

Các tính năng style query một shorthand property sẽ là true nếu các computed values khớp với mỗi longhand property của nó, và false nếu không. Ví dụ, `@container style({{cssxref("border")}}: 2px solid red)` sẽ giải quyết thành true nếu tất cả 12 longhand properties ({{cssxref("border-bottom-style")}}, v.v.) tạo nên shorthand đó được đặt thành các giá trị tương đương.

Các giá trị CSS toàn cục `revert` và `revert-layer` không hợp lệ như các giá trị trong `<style-feature>` và khiến container style query là false.

Không áp dụng các kiểu dáng bạn đang query trong style query cho phần tử bạn đang tạo kiểu với query đó vì điều này có thể gây ra vòng lặp vô hạn.

Dự kiến rằng style queries cũng sẽ chấp nhận properties trong boolean context. Style query sẽ trả về false nếu giá trị của property là initial value cho property đó (nếu nó chưa được thay đổi), và true nếu không.

```css
@container style(font-weight) {
}
```

Ví dụ trên sẽ trả về true cho bất kỳ phần tử nào có giá trị cho `font-weight` khác với initial value của nó. User-agent stylesheets đặt `font-weight: bold` cho các phần tử {{htmlelement("heading_elements", "heading")}} và {{htmlelement("th")}}, ví dụ. Một số trình duyệt đặt {{htmlelement("strong")}} và {{htmlelement("b")}} thành `bold`, một số khác thành `bolder`. {{htmlelement("optgroup")}} đôi khi cũng có `font-weight` khác `normal` được đặt bởi user agent. Miễn là `font-weight` của phần tử không phải là giá trị mặc định cho user-agent đó, style query sẽ trả về true.

Các tính năng này chưa được hỗ trợ trong bất kỳ trình duyệt nào.

## Xem thêm

- [Media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- CSS at-rule {{Cssxref("@container")}}
- Thuộc tính CSS {{Cssxref("contain")}}
- Thuộc tính viết tắt CSS {{Cssxref("container")}}
- Thuộc tính CSS {{Cssxref("container-name")}}
- [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
- [Understanding `aspect-ratio`](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- [Getting Started with Style Queries](https://developer.chrome.com/docs/css-ui/style-queries) (2022)
- [Style queries](https://una.im/style-queries/) via una.im (2022)
