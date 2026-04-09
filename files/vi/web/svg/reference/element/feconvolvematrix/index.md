---
title: <feConvolveMatrix>
slug: Web/SVG/Reference/Element/feConvolveMatrix
page-type: svg-element
browser-compat: svg.elements.feConvolveMatrix
sidebar: svgref
---

Phần tử primitive lọc **`<feConvolveMatrix>`** của [SVG](/en-US/docs/Web/SVG) áp dụng hiệu ứng lọc chập ma trận. Một phép chập kết hợp các pixel trong ảnh đầu vào với các pixel lân cận để tạo ra ảnh kết quả. Có thể đạt được nhiều thao tác xử lý ảnh khác nhau thông qua phép chập, bao gồm làm mờ, phát hiện cạnh, làm sắc nét, tạo nổi và tạo vát cạnh.

Phép chập ma trận dựa trên một ma trận n-by-m (kernel chập) mô tả cách một giá trị pixel nhất định trong ảnh đầu vào được kết hợp với các giá trị pixel lân cận để tạo ra giá trị pixel kết quả. Mỗi pixel kết quả được xác định bằng cách áp dụng ma trận kernel lên pixel nguồn tương ứng và các pixel lân cận của nó. Công thức chập cơ bản được áp dụng cho mỗi giá trị màu của một pixel là:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><msub><mi>color</mi><mrow><mi>X</mi><mi>,</mi><mi>Y</mi></mrow></msub><mo stretchy="false">=</mo><mrow><mfrac><mrow><mrow><mrow><munderover><mo stretchy="false">∑</mo><mrow><mrow><mi>i</mi><mo stretchy="false">=</mo><mn>0</mn></mrow></mrow><mrow><mrow><mi>orderY</mi><mo stretchy="false">−</mo><mn>1</mn></mrow></mrow></munderover><mrow><munderover><mo stretchy="false">∑</mo><mrow><mrow><mi>j</mi><mo stretchy="false">=</mo><mn>0</mn></mrow></mrow><mrow><mrow><mi>orderX</mi><mo stretchy="false">−</mo><mn>1</mn></mrow></mrow></munderover><msub><mi>source</mi><mrow><mrow><mrow><mi>x</mi><mo stretchy="false">−</mo><mi>targetX</mi></mrow><mo stretchy="false">+</mo><mi>j</mi></mrow><mi>,</mi><mrow><mrow><mi>y</mi><mo stretchy="false">−</mo><mi mathvariant="italic">targetY</mi></mrow><mo stretchy="false">+</mo><mi>i</mi></mrow></mrow></msub></mrow></mrow><mo stretchy="false">⋅</mo><msub><mi>kernelMatrix</mi><mrow><mrow><mrow><mi>orderX</mi><mo stretchy="false">−</mo><mi>j</mi></mrow><mo stretchy="false">−</mo><mn>1,</mn></mrow><mrow><mrow><mi>orderY</mi><mo stretchy="false">−</mo><mi>i</mi></mrow><mo stretchy="false">−</mo><mn>1</mn></mrow></mrow></msub></mrow></mrow><mrow><mi>divisor</mi></mrow></mfrac><mo stretchy="false">+</mo><mrow><mi>bias</mi><mo stretchy="false">⋅</mo><msub><mi>alpha</mi><mrow><mi>x</mi><mi>,</mi><mi>y</mi></mrow></msub></mrow></mrow></mrow></mrow><annotation encoding="TeX">\left(color\right)_{X , Y} = \frac{\sum_{i = 0}^{orderY - 1} \sum_{j = 0}^{orderX - 1} \left(source\right)_{x - targetX + j , y - \mathit{targetY} + i} \cdot \left(kernelMatrix\right)_{orderX - j - 1, orderY - i - 1}}{divisor} + bias \cdot \left(alpha\right)_{x , y}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

trong đó "orderX" và "orderY" biểu thị các giá trị X và Y cho thuộc tính [`order`](/en-US/docs/Web/SVG/Reference/Attribute/order), còn các biến khác tham chiếu tới các thuộc tính [`targetX`](/en-US/docs/Web/SVG/Reference/Attribute/targetX), [`targetY`](/en-US/docs/Web/SVG/Reference/Attribute/targetY), [`kernelMatrix`](/en-US/docs/Web/SVG/Reference/Attribute/kernelMatrix), [`divisor`](/en-US/docs/Web/SVG/Reference/Attribute/divisor), và [`bias`](/en-US/docs/Web/SVG/Reference/Attribute/bias).

Lưu ý trong các công thức trên rằng các giá trị trong kernel matrix được áp dụng sao cho kernel matrix được xoay 180 độ so với ảnh nguồn và ảnh đích để phù hợp với lý thuyết chập được mô tả trong nhiều giáo trình đồ họa máy tính.

Để minh họa, giả sử bạn có một ảnh đầu vào kích thước 5 pixel x 5 pixel, trong đó các giá trị màu cho một trong các kênh màu là như sau:

```plain
0    20  40 235 235
100 120 140 235 235
200 220 240 235 235
225 225 255 255 255
225 225 255 255 255
```

và bạn định nghĩa một kernel chập 3-by-3 như sau:

```plain
1 2 3
4 5 6
7 8 9
```

Hãy tập trung vào giá trị màu ở hàng thứ hai và cột thứ hai của ảnh (giá trị pixel nguồn là 120). Giả sử trường hợp đơn giản nhất (khi lưới pixel của ảnh đầu vào khớp hoàn hảo với lưới pixel của kernel) và giả sử các giá trị mặc định cho các thuộc tính [`divisor`](/en-US/docs/Web/SVG/Reference/Attribute/divisor), [`targetX`](/en-US/docs/Web/SVG/Reference/Attribute/targetX) và [`targetY`](/en-US/docs/Web/SVG/Reference/Attribute/targetY), thì giá trị màu kết quả sẽ là:

```plain
(9*0   + 8*20  + 7*40 +
 6*100 + 5*120 + 4*140 +
 3*200 + 2*220 + 1*240) / (9+8+7+6+5+4+3+2+1)
```

Giống như các primitive lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để thay bằng `sRGB`.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("order")}}
- {{SVGAttr("kernelMatrix")}}
- {{SVGAttr("divisor")}}
- {{SVGAttr("bias")}}
- {{SVGAttr("targetX")}}
- {{SVGAttr("targetY")}}
- {{SVGAttr("edgeMode")}}
- {{SVGAttr("kernelUnitLength")}}
- {{SVGAttr("preserveAlpha")}}
- [Thuộc tính primitive lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEConvolveMatrixElement")}}.

## Ví dụ

### SVG

```html
<svg
  width="200"
  height="200"
  viewBox="0 0 200 200"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <filter id="emboss">
      <feConvolveMatrix
        kernelMatrix="3 0 0
                      0 0 0
                      0 0 -3" />
    </filter>
  </defs>

  <image
    href="mdn.svg"
    x="0"
    y="0"
    height="200"
    width="200"
    filter="url(#emboss)" />
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", 200, 210)}}

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
- {{SVGElement("feComposite")}}
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
