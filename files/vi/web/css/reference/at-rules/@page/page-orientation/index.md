---
title: page-orientation
slug: Web/CSS/Reference/At-rules/@page/page-orientation
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.page.page-orientation
sidebar: cssref
---

Mô tả **`page-orientation`** của [CSS](/en-US/docs/Web/CSS) trong at-rule {{cssxref("@page")}} kiểm soát việc xoay trang được in. Nó xử lý luồng nội dung qua các trang khi hướng của một trang thay đổi. Hành vi này khác với mô tả [`size`](/en-US/docs/Web/CSS/Reference/At-rules/@page/size) ở chỗ người dùng có thể định nghĩa hướng xoay trang.

Mô tả này giúp với bố cục và hướng của các tài liệu được in, đặc biệt khi tài liệu được in hai mặt. Người dùng có thể chỉ định cách các trang sẽ được xoay khi in. Điều này đặc biệt hữu ích để trình bày nội dung như bảng, có thể rộng hơn phần còn lại của nội dung, theo hướng khác.

> [!NOTE]
> [Hộp lề](/en-US/docs/Web/CSS/Reference/At-rules/@page#margin_at-rules) và các phần tử định vị khác không có tương tác đặc biệt với mô tả này. Lề được bố trí bình thường trong trang chưa xoay, sau đó được xoay cùng với mọi thứ khác.

## Cú pháp

```css
/* Hiển thị nội dung in ở vị trí thẳng đứng */
@page {
  page-orientation: upright;
}

/* Hiển thị nội dung in được xoay ngược chiều kim đồng hồ */
@page {
  page-orientation: rotate-left;
}

/* Hiển thị nội dung in được xoay theo chiều kim đồng hồ */
@page {
  page-orientation: rotate-right;
}
```

## Giá trị

- `upright`
  - : Không có hướng nào được áp dụng và trang được bố trí và định dạng bình thường.
- `rotate-left`
  - : Sau khi trang được bố trí, trang phải được hiển thị xoay một phần tư vòng sang trái (ngược chiều kim đồng hồ).
- `rotate-right`
  - : Sau khi trang được bố trí, trang phải được hiển thị xoay một phần tư vòng sang phải (theo chiều kim đồng hồ).

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Xoay trang được in

Ví dụ này cho thấy cách nội dung của một tài liệu in có thể được xoay để phù hợp với nội dung trang và vị trí của trang.
Trong phần đầu tiên của mã CSS này, [các trang được đặt tên](/en-US/docs/Web/CSS/Reference/At-rules/@page#named_pages) được thiết lập để xác định hướng xoay nội dung.

```css live-sample___rotating-pages
@page upright {
  size: portrait;
  page-orientation: upright;
}

@page left {
  size: landscape;
  page-orientation: rotate-left;
}

@page right {
  size: landscape;
  page-orientation: rotate-right;
}
```

```css hidden live-sample___rotating-pages
fieldset {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  gap: 1rem;
  width: fit-content;
}
p {
  max-width: 60ch;
}
@media print {
  fieldset {
    display: none;
  }
  section {
    font-family: "Roboto", sans-serif;
    font-size: 1.5rem;
  }
}
```

Phần thứ hai của mã CSS khai báo một quy tắc trang được đặt tên đã được định nghĩa ở trên cho các selector, chẳng hạn như `<section class="left">…</section>`.

```css live-sample___rotating-pages
@media print {
  .upright {
    page: upright;
  }
  .left {
    page: left;
  }
  .right {
    page: right;
  }
}
```

```html hidden live-sample___rotating-pages
<fieldset id="printStyle">
  <legend>
    Click Print. The page will be laid out in the defined orientation.
  </legend>
  <button id="print">Print</button>
</fieldset>
<div id="print-area">
  <section class="upright">
    <h2>Section in Portrait/Upright</h2>
    <p>This section will be printed in portrait and upright with:</p>
    <pre>
.upright {
  size: portrait;
  page-orientation: upright;
}
    </pre>
    <p>Paragraph one.</p>
    <p>Paragraph two.</p>
  </section>
  <section class="left">
    <h2>Section in Landscape/Left</h2>
    <p>This section will be printed in landscape and rotated left with:</p>
    <pre>
.left {
  size: landscape;
  page-orientation: rotate-left;
}
    </pre>
    <table>
      <thead>
        <tr>
          <th></th>
          <th>100m</th>
          <th>1500m</th>
          <th>Hurdles</th>
          <th>Long Jump</th>
          <th>High Jump</th>
          <th>Javelin</th>
          <th>Discus</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>Dave</th>
          <td>9.65</td>
          <td>3:49</td>
          <td>12.64</td>
          <td>8.54m</td>
          <td>1.95m</td>
          <td>56.65m</td>
          <td>47.63m</td>
        </tr>
        <tr>
          <th>Simon</th>
          <td>9.87</td>
          <td>3:52</td>
          <td>11.89</td>
          <td>8.16m</td>
          <td>1.96m</td>
          <td>59.03m</td>
          <td>45.72m</td>
        </tr>
        <tr>
          <th>Fred</th>
          <td>9.67</td>
          <td>3:52</td>
          <td>12.03</td>
          <td>8.04m</td>
          <td>2.01m</td>
          <td>62.58m</td>
          <td>46.83m</td>
        </tr>
        <tr>
          <th>Gary</th>
          <td>9.77</td>
          <td>3:56</td>
          <td>13.04</td>
          <td>7.96m</td>
          <td>2.02m</td>
          <td>63.87m</td>
          <td>47.73m</td>
        </tr>
        <tr>
          <th>Dick</th>
          <td>9.95</td>
          <td>3:44</td>
          <td>12.99</td>
          <td>5.66m</td>
          <td>1.97m</td>
          <td>56.43m</td>
          <td>43.87m</td>
        </tr>
        <tr>
          <th>Tom</th>
          <td>9.84</td>
          <td>3:48</td>
          <td>12.86</td>
          <td>6.87m</td>
          <td>1.95m</td>
          <td>67.03m</td>
          <td>42.73m</td>
        </tr>
        <tr>
          <th>Harry</th>
          <td>9.91</td>
          <td>3:53</td>
          <td>13.77</td>
          <td>7.34m</td>
          <td>1.94m</td>
          <td>62.84m</td>
          <td>46.72m</td>
        </tr>
      </tbody>
    </table>
  </section>
  <section class="right">
    <h2>Section in Landscape/Right</h2>
    <p>This section will be printed in landscape and rotated right with:</p>
    <pre>
.right {
  size: landscape;
  page-orientation: rotate-right;
}
    </pre>
    <table>
      <thead>
        <tr>
          <th></th>
          <th>100m</th>
          <th>1500m</th>
          <th>Hurdles</th>
          <th>Long Jump</th>
          <th>High Jump</th>
          <th>Javelin</th>
          <th>Discus</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>Dave</th>
          <td>9.65</td>
          <td>3:49</td>
          <td>12.64</td>
          <td>8.54m</td>
          <td>1.95m</td>
          <td>56.65m</td>
          <td>47.63m</td>
        </tr>
        <tr>
          <th>Simon</th>
          <td>9.87</td>
          <td>3:52</td>
          <td>11.89</td>
          <td>8.16m</td>
          <td>1.96m</td>
          <td>59.03m</td>
          <td>45.72m</td>
        </tr>
        <tr>
          <th>Fred</th>
          <td>9.67</td>
          <td>3:52</td>
          <td>12.03</td>
          <td>8.04m</td>
          <td>2.01m</td>
          <td>62.58m</td>
          <td>46.83m</td>
        </tr>
        <tr>
          <th>Gary</th>
          <td>9.77</td>
          <td>3:56</td>
          <td>13.04</td>
          <td>7.96m</td>
          <td>2.02m</td>
          <td>63.87m</td>
          <td>47.73m</td>
        </tr>
        <tr>
          <th>Dick</th>
          <td>9.95</td>
          <td>3:44</td>
          <td>12.99</td>
          <td>5.66m</td>
          <td>1.97m</td>
          <td>56.43m</td>
          <td>43.87m</td>
        </tr>
        <tr>
          <th>Tom</th>
          <td>9.84</td>
          <td>3:48</td>
          <td>12.86</td>
          <td>6.87m</td>
          <td>1.95m</td>
          <td>67.03m</td>
          <td>42.73m</td>
        </tr>
        <tr>
          <th>Harry</th>
          <td>9.91</td>
          <td>3:53</td>
          <td>13.77</td>
          <td>7.34m</td>
          <td>1.94m</td>
          <td>62.84m</td>
          <td>46.72m</td>
        </tr>
      </tbody>
    </table>
  </section>
</div>
```

```js hidden live-sample___rotating-pages
const printButton = document.querySelector("#print");
printButton.addEventListener("click", () => {
  window.print();
});
```

Nhấp vào nút in để xem hướng trang khi in.

{{EmbedLiveSample('rotating-pages', '100%', '540', , , , , "allow-modals")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
