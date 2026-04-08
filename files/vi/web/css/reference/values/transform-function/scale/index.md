---
title: scale()
slug: Web/CSS/Reference/Values/transform-function/scale
page-type: css-function
browser-compat: css.types.transform-function.scale
sidebar: cssref
---

Hàm **`scale()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi thay đổi kích thước phần tử trên mặt phẳng 2D. Vì lượng tỉ lệ được xác định bởi vectơ [sx, sy], nó có thể thay đổi kích thước theo chiều nằm ngang và thẳng đứng với các tỉ lệ khác nhau. Kết quả của hàm là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: scale()")}}

```css interactive-example-choice
transform: scale(1);
```

```css interactive-example-choice
transform: scale(0.7);
```

```css interactive-example-choice
transform: scale(1.3, 0.4);
```

```css interactive-example-choice
transform: scale(-0.5, 1);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

Phép biến đổi tỉ lệ này được đặc trưng bởi một vectơ hai chiều. Tọa độ của nó xác định lượng tỉ lệ thực hiện theo mỗi chiều. Nếu cả hai tọa độ bằng nhau, tỉ lệ là đồng đều (_đẳng hướng_) và tỉ lệ khung hình của phần tử được giữ nguyên (đây là [phép biến đổi đồng dạng](https://en.wikipedia.org/wiki/Homothetic_transformation)).

Khi giá trị tọa độ nằm ngoài phạm vi \[-1, 1], phần tử lớn ra theo chiều đó; khi nằm bên trong, nó thu nhỏ lại. Giá trị âm dẫn đến [phép đối xứng qua điểm](https://en.wikipedia.org/wiki/Point_reflection) theo chiều đó. Giá trị `1` không có tác dụng.

> [!NOTE]
> Hàm `scale()` chỉ thay đổi tỉ lệ trong 2D. Để thay đổi tỉ lệ trong 3D, hãy dùng
> [`scale3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scale3d) thay thế.

## Cú pháp

```css
scale(sx)

scale(sx, sy)
```

### Giá trị

- `sx`
  - : Một {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị hoành độ (nằm ngang, thành phần x) của vectơ tỉ lệ.
- `sy` {{optional_inline}}
  - : Một {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị tung độ (thẳng đứng, thành phần y) của vectơ tỉ lệ.
    Nếu không được xác định, giá trị mặc định là `sx`, dẫn đến tỉ lệ đồng đều giữ nguyên {{glossary("aspect ratio")}} của phần tử.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col"><a href="/vi/docs/Web/CSS/Reference/Values/transform-function#cartesian_coordinates">Tọa độ Descartes</a> trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^2</a></th>
      <th scope="col"><a href="https://en.wikipedia.org/wiki/Homogeneous_coordinates">Tọa độ đồng nhất</a> trên <a href="https://en.wikipedia.org/wiki/Real_projective_plane">ℝℙ^2</a></th>
      <th scope="col">Tọa độ Descartes trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^3</a></th>
      <th scope="col">Tọa độ đồng nhất trên <a href="https://en.wikipedia.org/wiki/Real_projective_space">ℝℙ^3</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>sx</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>sy</mi></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cc} sx & 0 \\ 0 & sy \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>sx</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>sy</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} sx & 0 & 0 \\ 0 & sy & 0 \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>sx</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>sy</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} sx & 0 & 0 \\ 0 & sy & 0 \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>sx</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>sy</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} sx & 0 & 0 & 0 \\ 0 & sy & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
    <tr>
      <td><code>[sx 0 0 sy 0 0]</code></td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Khả năng tiếp cận

Hoạt ảnh phóng to/thu nhỏ gây ra vấn đề về khả năng tiếp cận, vì chúng thường là tác nhân gây ra một số loại đau nửa đầu. Nếu bạn cần đưa các hoạt ảnh như vậy vào trang web, bạn nên cung cấp điều khiển cho phép người dùng tắt hoạt ảnh, tốt nhất là trên toàn trang.

Ngoài ra, hãy cân nhắc sử dụng tính năng media {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}} — dùng nó để viết [truy vấn media](/vi/docs/Web/CSS/Guides/Media_queries) sẽ tắt hoạt ảnh nếu người dùng đã chỉ định giảm hoạt ảnh trong tùy chọn hệ thống.

Tìm hiểu thêm:

- [MDN Understanding WCAG, Guideline 2.3 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.3_%e2%80%94_seizures_and_physical_reactions_do_not_design_content_in_a_way_that_is_known_to_cause_seizures_or_physical_reactions)
- [Understanding Success Criterion 2.3.3 | W3C Understanding WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/animation-from-interactions)

## Ví dụ

### Thay đổi tỉ lệ theo cả chiều X và Y

#### HTML

```html
<div>Normal</div>
<div class="scaled">Scaled</div>
```

#### CSS

```css
div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.scaled {
  transform: scale(0.7); /* Equal to scaleX(0.7) scaleY(0.7) */
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Scaling_the_X_and_Y_dimensions_together", "200", "200")}}

### Thay đổi tỉ lệ X và Y riêng biệt và dịch chuyển gốc tọa độ

#### HTML

```html
<div>Normal</div>
<div class="scaled">Scaled</div>
```

#### CSS

```css
div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.scaled {
  transform: scale(2, 0.5); /* Equal to scaleX(2) scaleY(0.5) */
  transform-origin: left;
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Scaling_X_and_Y_dimensions_separately_and_translating_the_origin", "200", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- {{cssxref("scale")}}
- {{cssxref("zoom")}}
- {{cssxref("&lt;transform-function&gt;")}}
- {{cssxref("transform-function/scale3d", "scale3d()")}}
- Các thuộc tính biến đổi riêng lẻ khác {{cssxref("translate")}} và {{cssxref("rotate")}}
