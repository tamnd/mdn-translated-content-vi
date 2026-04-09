---
title: <feComposite>
slug: Web/SVG/Reference/Element/feComposite
page-type: svg-element
browser-compat: svg.elements.feComposite
sidebar: svgref
---

Phần tử primitive lọc **`<feComposite>`** của [SVG](/en-US/docs/Web/SVG) thực hiện việc kết hợp hai ảnh đầu vào theo từng pixel trong không gian ảnh bằng một trong các phép tổng hợp Porter-Duff: `over`, `in`, `atop`, `out`, `xor`, `lighter`, hoặc `arithmetic`.

Giống như các primitive lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để thay bằng `sRGB`.

Bảng dưới đây cho thấy từng phép toán này bằng cách dùng một hình ảnh logo MDN được tổng hợp với một hình tròn đỏ:

<table class="no-markdown">
  <tbody>
    <tr>
      <th>Phép toán</th>
      <th>Mô tả</th>
    </tr>
    <tr>
      <td>
        <p>over <img src="operation_over.png" alt="over operator" /></p>
      </td>
      <td>
        Đồ họa nguồn được định nghĩa bởi thuộc tính {{SVGAttr("in")}}
        (logo MDN) được đặt lên trên đồ họa đích được định nghĩa bởi
        thuộc tính {{SVGAttr("in2")}} (hình tròn).
        <p>
          Đây là <em>phép toán mặc định</em>, sẽ được dùng nếu không có
          phép toán nào được chỉ định hoặc nếu phép toán được chỉ định không được hỗ trợ.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>in <img src="operation_in.png" alt="in operator" /></p>
      </td>
      <td>
        Những phần của đồ họa nguồn được định nghĩa bởi thuộc tính
        <code>in</code> chồng lên đồ họa đích được định nghĩa trong thuộc tính
        <code>in2</code> sẽ thay thế đồ họa đích.
      </td>
    </tr>
    <tr>
      <td>
        <p>out <img src="operation_out.png" alt="out operator" /></p>
      </td>
      <td>
        Những phần của đồ họa nguồn được định nghĩa bởi thuộc tính
        <code>in</code> nằm ngoài đồ họa đích được định nghĩa trong thuộc tính
        <code>in2</code> sẽ được hiển thị.
      </td>
    </tr>
    <tr>
      <td>
        <p>atop <img src="operation_atop.png" alt="atop operator" /></p>
      </td>
      <td>
        Những phần của đồ họa nguồn được định nghĩa trong thuộc tính
        <code>in</code> chồng lên đồ họa đích được định nghĩa trong thuộc tính
        <code>in2</code> sẽ thay thế đồ họa đích. Những phần của đồ họa đích
        không chồng lấn với đồ họa nguồn sẽ được giữ nguyên.
      </td>
    </tr>
    <tr>
      <td>
        <p>xor <img src="operation_xor.png" alt="xor operator" /></p>
      </td>
      <td>
        Các vùng không chồng lấn của đồ họa nguồn được định nghĩa trong thuộc tính
        <code>in</code> và đồ họa đích được định nghĩa trong thuộc tính
        <code>in2</code> sẽ được kết hợp.
      </td>
    </tr>
    <tr>
      <td>
        <p>
          lighter <img src="operation_lighter.png" alt="lighter operator" />
        </p>
      </td>
      <td>
        Tổng của đồ họa nguồn được định nghĩa trong thuộc tính <code>in</code>
        và đồ họa đích được định nghĩa trong thuộc tính <code>in2</code> sẽ
        được hiển thị.
      </td>
    </tr>
    <tr>
      <td>
        <p>
          arithmetic
          <img src="operation_arithmetic.png" alt="arithmetic operator" />
        </p>
      </td>
      <td>
        <p>
          Phép toán <code>arithmetic</code> hữu ích khi kết hợp đầu ra từ các bộ
          lọc {{SVGElement("feDiffuseLighting")}} và
          {{SVGElement("feSpecularLighting")}} với dữ liệu texture. Nếu chọn
          phép toán <code>arithmetic</code>, mỗi pixel kết quả được tính bằng
          công thức sau:
        </p>
        <pre class="brush: plain">result = k1*i1*i2 + k2*i1 + k3*i2 + k4</pre>
        <p>trong đó:</p>
        <ul>
          <li>
            <code>i1</code> và <code>i2</code> biểu thị các giá trị kênh pixel
            tương ứng của ảnh đầu vào, ánh xạ tới {{SVGAttr("in")}} và
            {{SVGAttr("in2")}} tương ứng
          </li>
          <li>
            {{SVGAttr("k1")}}, {{SVGAttr("k2")}},
            {{SVGAttr("k3")}}, và {{SVGAttr("k4")}} biểu thị các giá trị của
            các thuộc tính cùng tên.
          </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}: Đầu vào thứ nhất cho primitive lọc đã cho.
- {{SVGAttr("in2")}}: Đầu vào thứ hai cho primitive lọc đã cho (hoạt động giống thuộc tính `in`).
- {{SVGAttr("operator")}}: `over` | `in` | `out` | `atop` | `xor` | `lighter` | `arithmetic`
- {{SVGAttr("k1")}}, {{SVGAttr("k2")}}, {{SVGAttr("k3")}}, {{SVGAttr("k4")}}: Các giá trị dùng để tính pixel kết quả trong primitive lọc `operator` là `arithmetic`.
- [Thuộc tính primitive lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFECompositeElement")}}.

## Ví dụ

Ví dụ này định nghĩa các bộ lọc cho từng phép toán được hỗ trợ (`over`, `atop`, `lighter`, v.v.), tổng hợp một `SourceGraphic` đầu vào với một hình ảnh logo MDN. Mỗi bộ lọc được áp dụng cho một phần tử hình tròn, rồi phần tử đó được dùng làm `SourceGraphic`.

> [!NOTE]
> `BackgroundImage` không thể được dùng làm nguồn tổng hợp trên các trình duyệt hiện đại, vì vậy chúng ta không thể định nghĩa một bộ lọc tổng hợp bằng cách dùng các pixel đang nằm bên dưới bộ lọc như một trong các nguồn. Cách tiếp cận được dùng ở đây là một [giải pháp thay thế vì chúng ta không thể dùng `BackgroundImage`](/en-US/docs/Web/SVG/Reference/Attribute/in#workaround_for_backgroundimage).

### SVG

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <filter id="imageOver">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite in2="SourceGraphic" operator="over" />
    </filter>
    <filter id="imageIn">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite in2="SourceGraphic" operator="in" />
    </filter>
    <filter id="imageOut">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite in2="SourceGraphic" operator="out" />
    </filter>
    <filter id="imageAtop">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite in2="SourceGraphic" operator="atop" />
    </filter>
    <filter id="imageXor">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite in2="SourceGraphic" operator="xor" />
    </filter>
    <filter id="imageArithmetic">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite
        in2="SourceGraphic"
        operator="arithmetic"
        k1="0.1"
        k2="0.2"
        k3="0.3"
        k4="0.4" />
    </filter>
    <filter id="imageLighter">
      <feImage href="mdn_logo_only_color.png" x="10px" y="10px" width="160px" />
      <feComposite in2="SourceGraphic" operator="lighter" />
    </filter>
  </defs>
  <g transform="translate(0,25)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageOver)" />
    <text x="80" y="-5">over</text>
  </g>
  <g transform="translate(200,25)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageIn)" />
    <text x="80" y="-5">in</text>
  </g>
  <g transform="translate(400,25)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageOut)" />
    <text x="80" y="-5">out</text>
  </g>
  <g transform="translate(600,25)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageAtop)" />
    <text x="80" y="-5">atop</text>
  </g>
  <g transform="translate(0,240)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageXor)" />
    <text x="80" y="-5">xor</text>
  </g>
  <g transform="translate(200,240)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageArithmetic)" />
    <text x="70" y="-5">arithmetic</text>
  </g>
  <g transform="translate(400,240)">
    <circle
      cx="90px"
      cy="80px"
      r="70px"
      fill="#cc0000"
      filter="url(#imageLighter)" />
    <text x="80" y="-5">lighter</text>
  </g>
</svg>
```

```css hidden
svg {
  width: 800px;
  height: 400px;
  display: inline;
}
```

### Kết quả

{{EmbedLiveSample("Example", 100, 450)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính primitive lọc SVG](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes)
- {{SVGElement("filter")}}
- {{SVGElement("animate")}}
- {{SVGElement("set")}}
- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
