---
title: cursor
slug: Web/CSS/Reference/Properties/cursor
page-type: css-property
browser-compat: css.properties.cursor
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`cursor`** đặt con trỏ chuột, nếu có, để hiển thị khi con trỏ chuột nằm trên một phần tử.

Thiết lập con trỏ nên thông báo cho người dùng về các thao tác chuột có thể thực hiện tại vị trí hiện tại, bao gồm: chọn văn bản, kích hoạt trợ giúp hoặc menu ngữ cảnh, sao chép nội dung, thay đổi kích thước bảng, v.v.
Bạn có thể chỉ định _kiểu_ con trỏ bằng từ khóa, hoặc tải một biểu tượng cụ thể để sử dụng (với hình ảnh dự phòng tùy chọn và từ khóa bắt buộc làm dự phòng cuối cùng).

{{InteractiveExample("CSS Demo: cursor")}}

```css interactive-example-choice
cursor: pointer;
```

```css interactive-example-choice
cursor: help;
```

```css interactive-example-choice
cursor: wait;
```

```css interactive-example-choice
cursor: crosshair;
```

```css interactive-example-choice
cursor: not-allowed;
```

```css interactive-example-choice
cursor: zoom-in;
```

```html interactive-example
<section class="default-example container" id="default-example">
  <div id="example-element">
    Move over this element to see the cursor style.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  background-color: #1766aa;
  color: white;
  height: 180px;
  width: 360px;
  justify-content: center;
  align-items: center;
  font-size: 14pt;
  padding: 5px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
cursor: auto;
cursor: pointer;
/* … */
cursor: zoom-out;

/* URL với từ khóa dự phòng bắt buộc */
cursor: url("hand.cur"), pointer;

/* URL và tọa độ, với từ khóa dự phòng bắt buộc */
cursor:
  url("cursor_1.png") 4 12,
  auto;
cursor:
  url("cursor_2.png") 2 2,
  pointer;

/* URL và URL dự phòng (một số có tọa độ), với từ khóa dự phòng bắt buộc */
cursor:
  url("cursor_1.svg") 4 5,
  url("cursor_2.svg"),
  /* …, */ url("cursor_n.cur") 5 5,
  progress;

/* Giá trị toàn cục */
cursor: inherit;
cursor: initial;
cursor: revert;
cursor: revert-layer;
cursor: unset;
```

Thuộc tính `cursor` được chỉ định là không hoặc nhiều giá trị `<url>`, phân tách bằng dấu phẩy, theo sau là một giá trị từ khóa bắt buộc duy nhất.
Mỗi `<url>` nên trỏ đến một tệp ảnh.
Trình duyệt sẽ thử tải ảnh đầu tiên được chỉ định, nếu không tải được sẽ chuyển sang ảnh tiếp theo, và nếu không tải được ảnh nào (hoặc không có ảnh nào được chỉ định) sẽ dùng giá trị từ khóa.

Mỗi `<url>` có thể tùy chọn theo sau bởi một cặp số phân tách bằng khoảng trắng, đặt tọa độ `<x>` và `<y>` của điểm nóng con trỏ so với góc trên bên trái của ảnh.

### Giá trị

- `<url>` {{optional_inline}}
  - : Một `url()` hoặc danh sách phân tách bằng dấu phẩy `url(), url(), …`, trỏ đến một tệp ảnh.
    Có thể cung cấp nhiều hơn một {{cssxref("url_value", "&lt;url&gt;")}} làm dự phòng, trong trường hợp một số loại ảnh con trỏ không được hỗ trợ.
    Một dự phòng không phải URL (một hoặc nhiều giá trị từ khóa) _phải_ nằm ở cuối danh sách dự phòng.
- `<x>`, `<y>` {{optional_inline}}
  - : Tọa độ x và y tùy chọn cho biết điểm nóng của con trỏ; vị trí chính xác trong con trỏ đang được trỏ tới.

    Các số tính bằng đơn vị pixel ảnh.
    Chúng tương đối với góc trên bên trái của ảnh, tương ứng với `0 0`, và bị giới hạn trong phạm vi ảnh con trỏ.
    Nếu các giá trị này không được chỉ định, chúng có thể được đọc từ chính tệp, và nếu không có sẽ mặc định về góc trên bên trái của ảnh.

- `keyword`
  - : Một giá trị từ khóa _phải_ được chỉ định, cho biết kiểu con trỏ cần sử dụng, hoặc con trỏ dự phòng sẽ dùng nếu tất cả các biểu tượng đã chỉ định đều tải thất bại.

    Các từ khóa có sẵn được liệt kê trong bảng bên dưới. Ngoại trừ `none`, có nghĩa là không có con trỏ, có một ảnh cho thấy cách các con trỏ từng được hiển thị. Bạn có thể di chuột qua các hàng trong bảng để xem tác dụng của các giá trị từ khóa con trỏ khác nhau trên trình duyệt của bạn hiện nay.

    <table class="standard-table">
      <thead>
        <tr>
          <th scope="col">Danh mục</th>
          <th scope="col">Từ khóa</th>
          <th scope="col">Ví dụ</th>
          <th scope="col">Mô tả</th>
        </tr>
      </thead>
      <tbody>
        <tr style="cursor: auto">
          <th rowspan="3" scope="row">Chung</th>
          <td><code>auto</code></td>
          <td></td>
          <td>
            Tác nhân người dùng sẽ xác định con trỏ hiển thị dựa trên ngữ cảnh hiện tại. Ví dụ: tương đương với <code>text</code> khi di chuột qua văn bản.
          </td>
        </tr>
        <tr style="cursor: default">
          <td><code>default</code></td>
          <td><img src="default.gif" alt="wide arrow pointing up and to the left" /></td>
          <td>Con trỏ mặc định phụ thuộc nền tảng. Thường là một mũi tên.</td>
        </tr>
        <tr style="cursor: none">
          <td><code>none</code></td>
          <td></td>
          <td>Không hiển thị con trỏ.</td>
        </tr>
        <tr style="cursor: context-menu">
          <th rowspan="5" scope="row" style="cursor: auto">Liên kết &#x26; trạng thái</th>
          <td><code>context-menu</code></td>
          <td><img alt="wide arrow pointing up and to the left slightly obscuring a menu icon" src="context-menu.png" /></td>
          <td>Có một menu ngữ cảnh.</td>
        </tr>
        <tr style="cursor: help">
          <td><code>help</code></td>
          <td><img src="help.gif" alt="wide arrow pointing up and to the left next to a question mark" /></td>
          <td>Có thông tin trợ giúp.</td>
        </tr>
        <tr style="cursor: pointer">
          <td><code>pointer</code></td>
          <td><img src="pointer.gif" alt="right hand with an index finger pointing up" /></td>
          <td>
            Con trỏ là một mũi tên chỉ liên kết. Thường là ảnh bàn tay đang chỉ.
          </td>
        </tr>
        <tr style="cursor: progress">
          <td><code>progress</code></td>
          <td><img src="progress.gif" alt="wide arrow and hour glass" /></td>
          <td>
            Chương trình đang bận trong nền, nhưng người dùng vẫn có thể tương tác với giao diện (khác với <code>wait</code>).
          </td>
        </tr>
        <tr style="cursor: wait">
          <td><code>wait</code></td>
          <td><img src="wait.gif" alt="hour glass" /></td>
          <td>
            Chương trình đang bận, và người dùng không thể tương tác với giao diện (khác với <code>progress</code>).
            Đôi khi là ảnh đồng hồ cát hoặc đồng hồ.
          </td>
        </tr>
        <tr style="cursor: cell">
          <th rowspan="4" scope="row" style="cursor: auto">Lựa chọn</th>
          <td><code>cell</code></td>
          <td><img src="cell.gif" alt="wide plus symbol" /></td>
          <td>Ô bảng hoặc tập hợp ô có thể được chọn.</td>
        </tr>
        <tr style="cursor: crosshair">
          <td><code>crosshair</code></td>
          <td><img src="crosshair.gif" alt="plus symbol composed of two thin lines." /></td>
          <td>Con trỏ hình chữ thập, thường dùng để chỉ lựa chọn trong ảnh bitmap.</td>
        </tr>
        <tr style="cursor: text">
          <td><code>text</code></td>
          <td><img class="default" src="text.gif" alt="vertical i-beam" /></td>
          <td>Văn bản có thể được chọn. Thường có hình dạng chữ I.</td>
        </tr>
        <tr style="cursor: vertical-text">
          <td><code>vertical-text</code></td>
          <td><img alt="horizontal i-beam" src="vertical-text.gif" /></td>
          <td>
            Văn bản dọc có thể được chọn. Thường có hình dạng chữ I nằm ngang.
          </td>
        </tr>
        <tr style="cursor: alias">
          <th rowspan="7" scope="row" style="cursor: auto">Kéo &#x26; thả</th>
          <td><code>alias</code></td>
          <td><img src="alias.gif" alt="wide arrow pointing up and to the left partially obscuring a smaller folder icon with a curved arrow pointing up and to the right"/></td>
          <td>Sẽ tạo một bí danh hoặc lối tắt.</td>
        </tr>
        <tr style="cursor: copy">
          <td><code>copy</code></td>
          <td><img class="default" src="copy.gif" alt="wide arrow pointing up and to the left partially obscuring a smaller folder icon with a plus sign" /></td>
          <td>Sẽ sao chép thứ gì đó.</td>
        </tr>
        <tr style="cursor: move">
          <td><code>move</code></td>
          <td><img src="move.gif" alt="plus sign made of two thin lines. The four points are small arrows facing out" /></td>
          <td>Sẽ di chuyển thứ gì đó.</td>
        </tr>
        <tr style="cursor: no-drop">
          <td><code>no-drop</code></td>
          <td>
            <img src="no-drop.gif" alt="pointer icon and a not allowed icon" />
          </td>
          <td>
            Một mục không thể được thả tại vị trí hiện tại.<br /><a href="https://bugzil.la/275173">Firefox bug 275173</a>:
            Trên Windows và macOS, <code>no-drop</code> giống với <code>not-allowed</code>.
          </td>
        </tr>
        <tr style="cursor: not-allowed">
          <td><code>not-allowed</code></td>
          <td><img alt="Not allowed icon, which is a circle with a line through it" src="not-allowed.gif" /></td>
          <td>Hành động yêu cầu sẽ không được thực hiện.</td>
        </tr>
        <tr style="cursor: grab">
          <td><code>grab</code></td>
          <td><img class="default" src="grab.gif" alt="fully opened hand icon" /></td>
          <td>Thứ gì đó có thể được nắm (kéo để di chuyển).</td>
        </tr>
        <tr style="cursor: grabbing">
          <td><code>grabbing</code></td>
          <td><img class="default" src="grabbing.gif" alt="closed hand icon, of the back of the hand"/></td>
          <td>Thứ gì đó đang được nắm (kéo để di chuyển).</td>
        </tr>
        <tr style="cursor: all-scroll">
          <th rowspan="15" scope="row" style="cursor: auto">
            Thay đổi kích thước &#x26; cuộn
          </th>
          <td><code>all-scroll</code></td>
          <td><img alt="icon of a medium size dot with four triangles around it." src="all-scroll.gif" /></td>
          <td>
            Thứ gì đó có thể cuộn theo bất kỳ hướng nào (kéo).<br /><a href="https://bugzil.la/275174">Firefox bug 275174</a>:
            Trên Windows, <code>all-scroll</code> giống với <code>move</code>.
          </td>
        </tr>
        <tr style="cursor: col-resize">
          <td><code>col-resize</code></td>
          <td><img alt="col-resize.gif" src="col-resize.gif" alt="two narrow parallel vertical lines with a small arrow pointing left and another pointing right" /></td>
          <td>
            Mục/cột có thể thay đổi kích thước theo chiều ngang.
            Thường được hiển thị dưới dạng mũi tên trái và phải với thanh dọc phân tách.
          </td>
        </tr>
        <tr style="cursor: row-resize">
          <td><code>row-resize</code></td>
          <td><img src="row-resize.gif" alt="two narrow parallel horizontal lines with a small arrow pointing up and another pointing down" /></td>
          <td>
            Mục/hàng có thể thay đổi kích thước theo chiều dọc.
            Thường được hiển thị dưới dạng mũi tên lên và xuống với thanh ngang phân tách.
          </td>
        </tr>
        <tr style="cursor: n-resize">
          <td><code>n-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing towards the top"
              src="n-resize.gif"
              style="border-style: solid; border-width: 0px"
            />
          </td>
          <td rowspan="8" style="cursor: auto">
            Một cạnh nào đó sẽ được di chuyển. Ví dụ: con trỏ <code>se-resize</code> được sử dụng khi di chuyển bắt đầu từ góc <em>đông nam</em> của hộp.<br />
            Trong một số môi trường, một con trỏ thay đổi kích thước hai chiều tương đương sẽ được hiển thị.
            Ví dụ: <code>n-resize</code> và <code>s-resize</code> giống với <code>ns-resize</code>.
          </td>
        </tr>
        <tr style="cursor: e-resize">
          <td><code>e-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing towards the right"
              src="e-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: s-resize">
          <td><code>s-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing down"
              src="s-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: w-resize">
          <td><code>w-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing towards the left"
              src="w-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: ne-resize">
          <td><code>ne-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing top-right"
              src="ne-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: nw-resize">
          <td><code>nw-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing top-left"
              src="nw-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: se-resize">
          <td><code>se-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing bottom-right"
              src="se-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: sw-resize">
          <td><code>sw-resize</code></td>
          <td>
            <img
              alt="thin long arrow pointing bottom-left"
              src="sw-resize.gif"
            />
          </td>
        </tr>
        <tr style="cursor: ew-resize">
          <td><code>ew-resize</code></td>
          <td><img alt="thin long arrow pointing left and right" class="default" src="3-resize.gif" /></td>
          <td rowspan="4" style="cursor: auto">Con trỏ thay đổi kích thước hai chiều.</td>
        </tr>
        <tr style="cursor: ns-resize">
          <td><code>ns-resize</code></td>
          <td><img alt="thin long arrow pointing up and down" class="default" src="6-resize.gif" /></td>
        </tr>
        <tr style="cursor: nesw-resize">
          <td><code>nesw-resize</code></td>
          <td><img alt="thin long arrow pointing both to the top-right and bottom-left" class="default" src="1-resize.gif" /></td>
        </tr>
        <tr style="cursor: nwse-resize">
          <td><code>nwse-resize</code></td>
          <td><img alt="thin long arrow pointing both to the top-left and bottom-right" class="default" src="4-resize.gif" /></td>
        </tr>
        <tr style="cursor: zoom-in">
          <th rowspan="2" scope="row" style="cursor: auto">Thu phóng</th>
          <td><code>zoom-in</code></td>
          <td><img alt="magnifying glass with a plus sign" class="default" src="zoom-in.gif" /></td>
          <td rowspan="2" style="cursor: auto">
            <p>Thứ gì đó có thể được phóng to hoặc thu nhỏ.</p>
          </td>
        </tr>
        <tr style="cursor: zoom-out">
          <td><code>zoom-out</code></td>
          <td><img alt="magnifying glass with a minus sign" class="default" src="zoom-out.gif" /></td>
        </tr>
      </tbody>
    </table>

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ghi chú sử dụng

### Giới hạn kích thước biểu tượng

Mặc dù đặc tả không giới hạn kích thước ảnh con trỏ `cursor`, {{Glossary("user agent", "tác nhân người dùng")}} thường hạn chế chúng để tránh lạm dụng tiềm ẩn.
Ví dụ: trên Firefox và Chromium, ảnh con trỏ bị hạn chế ở 128x128 pixel theo mặc định, nhưng khuyến nghị giới hạn kích thước ảnh con trỏ xuống còn 32x32 pixel. Các thay đổi con trỏ sử dụng ảnh lớn hơn kích thước tối đa được tác nhân người dùng hỗ trợ thường sẽ bị bỏ qua.

### Định dạng tệp ảnh được hỗ trợ

Tác nhân người dùng được yêu cầu theo đặc tả phải hỗ trợ tệp PNG, tệp SVG v1.1 ở chế độ tĩnh bảo mật có kích thước tự nhiên, và bất kỳ định dạng tệp ảnh không hoạt họa nào khác mà họ hỗ trợ cho ảnh trong các thuộc tính khác.
Trình duyệt máy tính để bàn cũng hỗ trợ rộng rãi định dạng tệp `.cur`.

Đặc tả tiếp tục chỉ ra rằng tác nhân người dùng _nên_ cũng hỗ trợ tệp SVG v1.1 ở chế độ hoạt họa bảo mật có kích thước tự nhiên, cùng với bất kỳ định dạng tệp ảnh hoạt họa nào khác mà họ hỗ trợ cho ảnh trong các thuộc tính khác.
Tác nhân người dùng _có thể_ hỗ trợ cả ảnh SVG tĩnh lẫn hoạt họa không có kích thước tự nhiên.

### iPadOS

iPadOS hỗ trợ thiết bị con trỏ như trackpad và chuột. Theo mặc định, con trỏ iPad được hiển thị dưới dạng hình tròn, và giá trị duy nhất được hỗ trợ sẽ thay đổi giao diện con trỏ là `text`.

### Ghi chú khác

Các thay đổi con trỏ giao với khu vực thanh công cụ thường bị chặn để tránh giả mạo.

## Ví dụ

### Đặt kiểu con trỏ

```css
.foo {
  cursor: crosshair;
}

.bar {
  cursor: zoom-in;
}

/* Giá trị từ khóa dự phòng là bắt buộc khi sử dụng URL */
.baz {
  cursor: url("hyper.cur"), auto;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("pointer-events")}}
- Kiểu {{cssxref("url_value", "&lt;url&gt;")}}
- Thuộc tính SVG {{SVGAttr("cursor")}}
