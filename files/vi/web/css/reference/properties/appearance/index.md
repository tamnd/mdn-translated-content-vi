---
title: appearance
slug: Web/CSS/Reference/Properties/appearance
page-type: css-property
browser-compat: css.properties.appearance
sidebar: cssref
---

Thuộc tính **`appearance`** [CSS](/en-US/docs/Web/CSS) xác định giao diện hiển thị của các phần tử widget UI thay thế như các điều khiển biểu mẫu. Phổ biến nhất, các phần tử như vậy được tạo kiểu bằng giao diện native của nền tảng dựa trên chủ đề hệ điều hành, hoặc có giao diện nguyên thủy với các kiểu có thể ghi đè bằng CSS.

{{InteractiveExample("CSS Demo: appearance")}}

```css interactive-example-choice
appearance: auto;
```

```css interactive-example-choice
appearance: none;
```

```css interactive-example-choice
appearance: textfield;
```

```html interactive-example
<section id="default-example">
  <div class="background" id="example-element">
    <input type="search" value="search" aria-label="unlabeled search" />
    <input type="checkbox" aria-label="unlabeled checkbox" />
    <input type="radio" aria-label="unlabeled radio button" />
    <button>Button</button>
  </div>
</section>
```

```css interactive-example
input,
button {
  appearance: inherit;
}
```

## Cú pháp

```css
/* Giá trị CSS Basic User Interface Module Level 4 */
appearance: none;
appearance: auto;
appearance: menulist-button;
appearance: textfield;
appearance: base-select;

/* Giá trị toàn cục */
appearance: inherit;
appearance: initial;
appearance: revert;
appearance: revert-layer;
appearance: unset;

/* Giá trị <compat-auto> có hiệu ứng giống 'auto' */
appearance: button;
appearance: checkbox;
```

### Giá trị

Thuộc tính `appearance` có thể được áp dụng cho tất cả các phần tử và pseudo-element, nhưng hiệu ứng của giá trị được chỉ định, nếu có, phụ thuộc vào phần tử được áp dụng.

- `none`
  - : Cấp cho widget giao diện _nguyên thủy_, cho phép tạo kiểu qua CSS, trong khi vẫn duy trì chức năng native của widget. Giá trị này không ảnh hưởng đến các phần tử không phải widget.

- `auto`
  - : Thiết lập các widget tương tác để hiển thị với giao diện _native của OS_. Hoạt động như `none` trên các phần tử không có kiểu dáng native của OS.

- `base-select`
  - : Chỉ liên quan đến phần tử {{htmlelement("select")}} và pseudo-element {{cssxref("::picker()", "::picker(select)")}}, cho phép chúng được tạo kiểu đầy đủ.

- `<compat-special>`
  - : Có hiệu ứng tương tự `auto` trên một số phần tử nhất định.
    - `textfield`
      - : Khiến giao diện của một số kiểu `<input>` [khớp với giao diện kiểu `text`](#try_it).
    - `menulist-button`
      - : Khi thiết lập trên phần tử `<select>`, kiểu của dropdown picker [khớp với trạng thái mặc định của nó](#setting_the_appearance_of_a_select).

- `<compat-auto>`
  - : Được bao gồm để tương thích ngược; các giá trị có thể bao gồm `button`, `checkbox`, `listbox`, `menulist`, `meter`, `progress-bar`, `push-button`, `radio`, `searchfield`, `slider-horizontal`, `square-button` và `textarea`. Tất cả các giá trị hoạt động như `auto`: hãy dùng `auto` thay thế.

> [!NOTE]
> Đặc tả cũng định nghĩa giá trị `base`. Giá trị này hiện chưa được hỗ trợ bởi bất kỳ trình duyệt nào.

#### Giá trị không chuẩn

Một số giá trị không chuẩn cũng được hỗ trợ trong một số trình duyệt:

- `slider-vertical`
  - : Làm thanh trượt theo chiều dọc khi áp dụng cho các phần tử `<input type="range">`. Để [tạo thanh trượt dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls), bạn nên đặt {{cssxref("writing-mode")}} thành `vertical-lr` và {{cssxref("direction")}} thành `rtl`.

- `-apple-pay-button`
  - : Hiển thị logo Apple Pay khi thiết lập trên phần tử {{htmlelement("button")}}, {{htmlelement("a")}} hoặc {{htmlelement("input")}} loại `button` hoặc `reset`.

## Mô tả

Thuộc tính `appearance` cho phép hiển thị các phần tử theo kiểu native của OS dựa trên chủ đề hệ điều hành, cũng như loại bỏ bất kỳ kiểu native của nền tảng nào với giá trị `none`. Thiết lập `appearance: none`, hoặc thay đổi giao diện của widget UI theo cách khác, không thay đổi chức năng của phần tử.

Trong khi hầu hết các phần tử trong tài liệu có thể được tạo kiểu đầy đủ bằng CSS, các điều khiển UI (_widget_) thường được trình duyệt hiển thị bằng kiểu giao diện native của hệ điều hành. Giao diện _native_ này khác nhau giữa các hệ điều hành và trình duyệt. Ở trạng thái mặc định này, widget có ít hoặc không có tính năng nào có thể được tạo kiểu với CSS. Các phần tử nào có giao diện UI native này được định nghĩa trong HTML.

Thuộc tính `appearance` cung cấp một số quyền kiểm soát giao diện của các widget HTML mà theo mặc định trông giống như các điều khiển native của hệ điều hành. Đáng chú ý nhất, giá trị `none` loại bỏ một số giao diện native của widget. Điều này tạo ra kiểu nhìn _nguyên thủy_ có thể được tạo kiểu qua CSS trong khi vẫn duy trì chức năng và hỗ trợ tương tác người dùng native.

Một số widget biến mất hoàn toàn khi được thiết lập thành `appearance: none`. Các điều khiển ẩn vẫn tương tác được. Ví dụ, nhấp vào {{htmlelement("label")}} liên kết với checkbox `appearance: none` vẫn sẽ bật/tắt trạng thái checked của checkbox.

Do `none` có thể khiến widget bị ẩn, giá trị `base` đang được thêm vào để cung cấp cho widget một giao diện cơ bản. Khi được hỗ trợ, giá trị `base` sẽ đảm bảo widget duy trì giao diện native trong khi cho phép CSS thay đổi các kiểu không thể thay đổi mặc định. Không giống `none` có thể làm nút radio và checkbox biến mất, `base` cung cấp cho widget giao diện nguyên thủy với các kiểu native mặc định có thể sử dụng và tương thích, cũng như cho phép mức độ tùy chỉnh tốt qua CSS. Giá trị `base` này chưa được hỗ trợ, nhiều giá trị `<compat-auto>` cung cấp chức năng tương tự nhưng dành riêng cho từng loại và không toàn cục.

### Phần tử select có thể tùy chỉnh

Giá trị `base-select`, chỉ liên quan đến phần tử {{htmlelement("select")}} và pseudo-element {{cssxref("::picker()", "::picker(select)")}}, cho phép [tạo kiểu phần tử `<select>` và select picker](#setting_the_appearance_of_a_select) (chứa các phần tử `<option>`). Picker được hiển thị trong top layer, tương tự như popover. Khi `base-select` được đặt, picker có thể được định vị tương đối với select (hoặc các phần tử khác) bằng tính năng [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning). Ngoài ra, giá trị `base-select` khiến `<select>` không hiển thị bên ngoài ngăn trình duyệt hoặc kích hoạt các thành phần hệ điều hành di động tích hợp. Nó cũng không còn được đặt kích thước dựa trên chiều rộng của `<option>` rộng nhất.

Xem [Customizable select elements](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) để biết thêm thông tin.

### Giá trị không chuẩn có tiền tố

Trước khi chuẩn hóa, các thuộc tính có tiền tố **`-moz-appearance`** và **`-webkit-appearance`** cho phép hiển thị các phần tử như widget như nút hoặc checkbox. Các giá trị không chuẩn sau có thể được gặp trong các stylesheet kế thừa, phổ biến nhất là giá trị của [prefixed pseudo-elements](/en-US/docs/Web/CSS/Reference/Webkit_extensions#pseudo-elements) của thành phần shadow DOM.

<details>
<summary>Non-standard values</summary>

- `attachment`
- `borderless-attachment`
- `button-bevel`
- `caps-lock-indicator`
- `caret`
- `checkbox-container`
- `checkbox-label`
- `checkmenuitem`
- `color-well`
- `continuous-capacity-level-indicator`
- `default-button`
- `discrete-capacity-level-indicator`
- `inner-spin-button`
- `image-controls-button`
- `list-button`
- `listitem`
- `media-enter-fullscreen-button`
- `media-exit-fullscreen-button`
- `media-fullscreen-volume-slider`
- `media-fullscreen-volume-slider-thumb`
- `media-mute-button`
- `media-play-button`
- `media-overlay-play-button`
- `media-return-to-realtime-button`
- `media-rewind-button`
- `media-seek-back-button`
- `media-seek-forward-button`
- `media-toggle-closed-captions-button`
- `media-slider`
- `media-sliderthumb`
- `media-volume-slider-container`
- `media-volume-slider-mute-button`
- `media-volume-slider`
- `media-volume-sliderthumb`
- `media-controls-background`
- `media-controls-dark-bar-background`
- `media-controls-fullscreen-background`
- `media-controls-light-bar-background`
- `media-current-time-display`
- `media-time-remaining-display`
- `menulist-text`
- `menulist-textfield`
- `meterbar`
- `number-input`
- `progress-bar-value`
- `progressbar`
- `progressbar-vertical`
- `range`
- `range-thumb`
- `rating-level-indicator`
- `relevancy-level-indicator`
- `scale-horizontal`
- `scalethumbend`
- `scalethumb-horizontal`
- `scalethumbstart`
- `scalethumbtick`
- `scalethumb-vertical`
- `scale-vertical`
- `scrollbarthumb-horizontal`
- `scrollbarthumb-vertical`
- `scrollbartrack-horizontal`
- `scrollbartrack-vertical`
- `searchfield-decoration`
- `searchfield-results-decoration`
- `searchfield-results-button`
- `searchfield-cancel-button`
- `snapshotted-plugin-overlay`
- `sheet`
- `sliderthumb-horizontal`
- `sliderthumb-vertical`
- `textfield-multiline`

</details>

Các tác giả được khuyến khích chỉ sử dụng các từ khóa chuẩn.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Ví dụ này minh họa cách sử dụng cơ bản của thuộc tính `appearance`, thay đổi giao diện của phần tử {{htmlelement("input")}} trong một số trình duyệt.

#### HTML

Chúng ta bao gồm hai điều khiển biểu mẫu `number` cùng nhãn của chúng.

```html
<p>
  <label>Enter a number: <input type="number" min="0" max="10" /></label>
</p>
<p>
  <label
    >Enter a number: <input type="number" min="0" max="10" class="text"
  /></label>
</p>
```

#### CSS

Chúng ta thiết lập phần tử có class `text` trông như trường văn bản.

```css
.text {
  appearance: textfield;
}
```

#### Kết quả

{{EmbedLiveSample("Basic example", 600, 100)}}

Tùy thuộc vào trình duyệt, spinner có thể bị ẩn trực quan khi điều khiển được thiết lập trông như trường văn bản. Thuộc tính `appearance` không ảnh hưởng đến chức năng: ví dụ, dù không còn spinner để nhấp vào, các phím mũi tên lên và xuống vẫn tăng và giảm giá trị.

### Appearance thiết lập thành `none`

Ví dụ sau minh họa cách loại bỏ kiểu dáng mặc định khỏi checkbox, nút radio và phần tử {{htmlelement("select")}}, rồi áp dụng kiểu tùy chỉnh.

#### HTML

Chúng ta bao gồm các cặp checkbox, nút radio và phần tử `<select>`, cùng nhãn liên kết:

```html
<label><input type="checkbox" /> Default unchecked </label>
<label><input type="checkbox" checked /> Default checked </label>

<hr />

<label><input type="radio" name="radio" /> Default unchecked </label>
<label><input type="radio" name="radio" checked /> Default checked </label>

<hr />

<label
  >Unstyled select
  <select>
    <option>Option 1</option>
    <option>Option 2</option>
  </select>
</label>

<label
  >Styled select
  <select class="none">
    <option>Option 1</option>
    <option>Option 2</option>
  </select>
</label>
```

#### CSS

```css hidden
label {
  display: block;
  margin: 0.5em 0;
}
```

Chúng ta áp dụng kiểu cho cả hai phần tử {{htmlelement("input")}} loại `checkbox`; các kiểu này tạo hình vuông đỏ nếu phần tử có thể được tạo kiểu. Chúng ta thiết lập `appearance: none` trên trạng thái UI {{cssxref(":checked")}} cho tất cả input (`checkbox` và `radio`), cũng như cho các phần tử có class `.none`. Điều này loại bỏ tất cả kiểu của nút radio và checkbox, ngoài margin, cho phép các kiểu đã thiết lập được áp dụng. Không có kiểu thay thế được cung cấp cho nút radio hoặc phần tử `<select>` khi `none` được thiết lập.

```css
[type="checkbox"] {
  width: 1em;
  height: 1em;
  display: inline-block;
  background: red;
}
input:checked,
.none {
  appearance: none;
}
```

#### Kết quả

{{EmbedLiveSample("Appearance set to none", 600, 220)}}

Thiết lập `appearance: none` cho phép tạo kiểu các phần tử UI, nhưng cũng có nguy cơ ẩn widget. Checkbox chưa được chọn, với `appearance` mặc định là `auto`, trông giống như checkbox. Thiết lập `appearance: none` ở trạng thái `:checked` cho phép tạo kiểu.

Giống như checkbox chưa được chọn, nút radio chưa được chọn trông giống như widget UI native, vì nó là như vậy. Khi ở trạng thái được chọn, với `appearance: none` được áp dụng, nút radio biến mất; chức năng của nó được giữ lại, và chỉ có margin ảnh hưởng đến hiển thị trang.

### Thiết lập giao diện của select

Chúng ta có thể dùng thuộc tính `appearance` để chọn tham gia vào chức năng select tùy chỉnh, cho phép tạo kiểu phần tử `<select>` và picker của nó, đại diện cho phần của điều khiển biểu mẫu bật ra khỏi trang.

#### HTML

Chúng ta bao gồm ba phần tử `<select>`, với cùng nhiều phần tử con {{htmlelement("option")}}. Như với mỗi `<select>`, chúng ta cũng bao gồm các phần tử {{htmlelement("label")}} liên kết. Tùy chọn thứ ba có nhiều văn bản hơn để minh họa hiệu ứng của `base-select` trên chiều rộng của `<select>`:

```html
<label for="ice-cream1"
  >Default flavor:
  <select id="ice-cream1">
    <option>Asparagus</option>
    <option>Dulce de leche</option>
    <option>Pistachio, rum raisin, and coffee</option>
  </select>
</label>
<label for="ice-cream2"
  >Base select flavor:
  <select id="ice-cream2" class="baseSelect">
    <option>Asparagus</option>
    <option>Dulce de leche</option>
    <option>Pistachio, rum raisin, and coffee</option>
  </select>
</label>
<label for="ice-cream3"
  >Menulist button flavor:
  <select id="ice-cream3" class="menulistButton">
    <option>Asparagus</option>
    <option>Dulce de leche</option>
    <option>Pistachio, rum raisin, and coffee</option>
  </select>
</label>
```

#### CSS

Chúng ta chọn picker của tất cả các phần tử `<select>` bằng pseudo-element {{cssxref("::picker()")}} với tham số `select`. Chúng ta thiết lập giá trị `appearance` của tất cả picker và một phần tử `<select>` thành `base-select`. Chúng ta thiết lập `<select>` cuối cùng thành `menulist-button`. `<select>` đầu tiên mặc định theo trạng thái `auto`:

```css
.baseSelect,
::picker(select) {
  appearance: base-select;
}
.menulistButton {
  appearance: menulist-button;
}
```

```css
label {
  display: block;
}
```

Chúng ta thiết lập giá trị cho các thuộc tính {{cssxref("background-color")}} và {{cssxref("border")}} của `<select>` và picker để minh họa hiệu ứng của các giá trị `appearance`:

```css
select {
  border: 1px solid red;
  background-color: orange;
}

::picker(select) {
  background-color: yellow;
  border: none;
}
```

#### Kết quả

{{EmbedLiveSample("Setting the appearance of a select", 1050, 80)}}

Trong khi các kiểu {{cssxref("background-color")}} và {{cssxref("border")}} được định nghĩa trên tất cả các phần tử `<select>` và picker, kiểu `::picker(select)` chỉ ảnh hưởng đến picker nơi cả select và picker đều có thuộc tính `appearance` được thiết lập thành `base-select`. Select đầu tiên và thứ ba trông giống nhau vì `menulist-button` là từ khóa tương thích.

Lưu ý rằng theo mặc định, inline-size của `<select>` thường là inline-size của `<option>` có nhiều văn bản nhất, và dropdown picker xuất hiện phía trên trang được hiển thị khi mở, khiến nó không bị ràng buộc bởi trang xung quanh và hiển thị hoàn toàn. Các nhận xét này không còn đúng khi `base-select` được thiết lập.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`prefers-color-scheme`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme)
