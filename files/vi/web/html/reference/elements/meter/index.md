---
title: "<meter>: Phần tử Đồng hồ đo HTML"
slug: Web/HTML/Reference/Elements/meter
page-type: html-element
browser-compat: html.elements.meter
sidebar: htmlsidebar
---

Phần tử **`<meter>`** trong [HTML](/vi/docs/Web/HTML) biểu diễn một giá trị vô hướng trong một phạm vi đã biết hoặc một giá trị phân số.

{{InteractiveExample("HTML Demo: &lt;meter&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="fuel">Fuel level:</label>

<meter id="fuel" min="0" max="100" low="33" high="66" optimum="80" value="50">
  at 50/100
</meter>
```

```css interactive-example
label {
  padding-right: 10px;
  font-size: 1rem;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `value`
  - : Giá trị số hiện tại. Giá trị này phải nằm trong khoảng giá trị nhỏ nhất và lớn nhất (thuộc tính `min` và thuộc tính `max`) nếu chúng được chỉ định. Nếu không được chỉ định hoặc không hợp lệ, giá trị mặc định là `0`. Nếu được chỉ định nhưng không nằm trong khoảng do thuộc tính `min` và thuộc tính `max` xác định, giá trị sẽ bằng đầu gần nhất của khoảng đó.

    > [!NOTE]
    > Trừ khi thuộc tính `value` nằm trong khoảng từ `0` đến `1` (bao gồm cả hai đầu), thuộc tính `min` và `max` nên xác định phạm vi sao cho giá trị của thuộc tính `value` nằm trong đó.

- [`min`](/vi/docs/Web/HTML/Reference/Attributes/min)
  - : Giới hạn số thấp hơn của phạm vi được đo. Giá trị này phải nhỏ hơn giá trị lớn nhất (thuộc tính `max`), nếu được chỉ định. Nếu không được chỉ định, giá trị nhỏ nhất là `0`.
- [`max`](/vi/docs/Web/HTML/Reference/Attributes/max)
  - : Giới hạn số cao hơn của phạm vi được đo. Giá trị này phải lớn hơn giá trị nhỏ nhất (thuộc tính `min`), nếu được chỉ định. Nếu không được chỉ định, giá trị lớn nhất là `1`.
- `low`
  - : Giới hạn số cao hơn của đầu thấp của phạm vi được đo. Giá trị này phải lớn hơn giá trị nhỏ nhất (thuộc tính `min`), và cũng phải nhỏ hơn giá trị high và giá trị lớn nhất (thuộc tính `high` và thuộc tính `max` tương ứng), nếu có. Nếu không được chỉ định, hoặc nhỏ hơn giá trị nhỏ nhất, giá trị `low` sẽ bằng giá trị nhỏ nhất.
- `high`
  - : Giới hạn số thấp hơn của đầu cao của phạm vi được đo. Giá trị này phải nhỏ hơn giá trị lớn nhất (thuộc tính `max`), và cũng phải lớn hơn giá trị low và giá trị nhỏ nhất (thuộc tính `low` và thuộc tính `min` tương ứng), nếu có. Nếu không được chỉ định, hoặc lớn hơn giá trị lớn nhất, giá trị `high` sẽ bằng giá trị lớn nhất.
- `optimum`
  - : Thuộc tính này chỉ ra giá trị số tối ưu. Nó phải nằm trong phạm vi (được xác định bởi thuộc tính `min` và thuộc tính `max`). Khi dùng với thuộc tính `low` và thuộc tính `high`, nó cho biết vị trí nào trong phạm vi được coi là ưa thích. Ví dụ, nếu nó nằm giữa thuộc tính `min` và thuộc tính `low`, thì phạm vi thấp hơn được coi là ưa thích. Trình duyệt có thể tô màu thanh đồng hồ đo khác nhau tùy thuộc vào giá trị có nhỏ hơn hoặc bằng giá trị tối ưu hay không.

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<p>Battery level: <meter min="0" max="100" value="75">75%</meter></p>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 300, 60)}}

### Ví dụ phạm vi cao và thấp

Lưu ý rằng trong ví dụ này thuộc tính [`min`](#min) bị bỏ qua. Điều này được phép, vì nó sẽ mặc định là `0`.

#### HTML

```html
<p>
  Student's exam score:
  <meter low="50" high="80" max="100" value="84">84%</meter>
</p>
```

#### Kết quả

{{EmbedLiveSample("High_and_Low_range_example", 300, 60)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung có thể gán nhãn, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >, nhưng không được có phần tử <code>&#x3C;meter></code> nào trong số các phần tử con.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được bỏ qua, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">meter</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLMeterElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tạo các điều khiển biểu mẫu dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls)
- {{HTMLElement("progress")}}
- {{cssxref("::-webkit-meter-bar")}}, {{cssxref("::-webkit-meter-inner-element") }}, {{cssxref("::-webkit-meter-even-less-good-value")}}, {{cssxref("::-webkit-meter-optimum-value")}}, {{cssxref("::-webkit-meter-suboptimum-value")}}: các pseudo-element không chuẩn
