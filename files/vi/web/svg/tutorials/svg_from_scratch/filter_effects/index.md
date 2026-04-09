---
title: Hiệu ứng bộ lọc
slug: Web/SVG/Tutorials/SVG_from_scratch/Filter_effects
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG", "Web/SVG/Tutorials/SVG_from_scratch/Using_fonts") }}

Có những tình huống mà các hình dạng cơ bản không cung cấp đủ tính linh hoạt để bạn đạt được một hiệu ứng nhất định. Đổ bóng, để lấy một ví dụ phổ biến, không thể tạo ra hợp lý chỉ bằng cách kết hợp các gradient. Filters là cơ chế của SVG để tạo ra các hiệu ứng tinh vi.

Một ví dụ cơ bản là thêm hiệu ứng làm mờ cho nội dung SVG. Mặc dù có thể đạt được các mức mờ cơ bản nhờ gradient, nhưng filter blur là cần thiết để làm bất cứ điều gì vượt quá mức đó.

## Ví dụ

Filters được định nghĩa bởi phần tử {{SVGElement('filter')}}, phần tử này nên được đặt trong phần `<defs>` của tệp SVG. Bên trong các thẻ filter là một danh sách các _primitive_: các thao tác cơ bản xây dựng dựa trên các thao tác trước đó (như làm mờ, thêm hiệu ứng ánh sáng, v.v.). Để áp dụng filter bạn tạo cho một phần tử đồ họa, hãy đặt thuộc tính {{SVGAttr('filter')}}.

```html
<svg
  width="250"
  viewBox="0 0 200 85"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1">
  <defs>
    <!-- Filter declaration -->
    <filter
      id="MyFilter"
      filterUnits="userSpaceOnUse"
      x="0"
      y="0"
      width="200"
      height="120">
      <!-- offsetBlur -->
      <feGaussianBlur in="SourceAlpha" stdDeviation="4" result="blur" />
      <feOffset in="blur" dx="4" dy="4" result="offsetBlur" />

      <!-- litPaint -->
      <feSpecularLighting
        in="blur"
        surfaceScale="5"
        specularConstant=".75"
        specularExponent="20"
        lighting-color="#bbbbbb"
        result="specOut">
        <fePointLight x="-5000" y="-10000" z="20000" />
      </feSpecularLighting>
      <feComposite
        in="specOut"
        in2="SourceAlpha"
        operator="in"
        result="specOut" />
      <feComposite
        in="SourceGraphic"
        in2="specOut"
        operator="arithmetic"
        k1="0"
        k2="1"
        k3="1"
        k4="0"
        result="litPaint" />

      <!-- merge offsetBlur + litPaint -->
      <feMerge>
        <feMergeNode in="offsetBlur" />
        <feMergeNode in="litPaint" />
      </feMerge>
    </filter>
  </defs>

  <!-- Graphic elements -->
  <g filter="url(#MyFilter)">
    <path
      fill="none"
      stroke="#D90000"
      stroke-width="10"
      d="M50,66 c-50,0 -50,-60 0,-60 h100 c50,0 50,60 0,60z" />
    <path
      fill="#D90000"
      d="M60,56 c-30,0 -30,-40 0,-40 h80 c30,0 30,40 0,40z" />
    <g fill="white" stroke="black" font-size="45" font-family="Verdana">
      <text x="52" y="52">SVG</text>
    </g>
  </g>
</svg>
```

{{ EmbedLiveSample('Example', '100%', 120) }}

### Bước 1

```html
<feGaussianBlur in="SourceAlpha" stdDeviation="4" result="blur" />
```

{{SVGElement('feGaussianBlur')}} nhận `in` là "SourceAlpha", tức kênh alpha của đồ họa nguồn; áp dụng độ mờ 4; và lưu `result` vào một bộ đệm tạm tên là "blur".

### Bước 2

```html
<feOffset in="blur" dx="4" dy="4" result="offsetBlur" />
```

{{SVGElement('feOffset')}} nhận `in` là "blur", thứ mà chúng ta vừa tạo; dịch kết quả sang phải "4" và xuống dưới "4"; và lưu `result` vào bộ đệm "offsetBlur". Hai primitive đầu tiên vừa tạo ra một bóng đổ.

### Bước 3

```html
<feSpecularLighting
  in="offsetBlur"
  surfaceScale="5"
  specularConstant=".75"
  specularExponent="20"
  lighting-color="#bbbbbb"
  result="specOut">
  <fePointLight x="-5000" y="-10000" z="20000" />
</feSpecularLighting>
```

{{SVGelement('feSpecularLighting')}} nhận `in` là "offsetBlur", tạo ra hiệu ứng ánh sáng, và lưu `result` vào bộ đệm "specOut".

### Bước 4

```html
<feComposite in="specOut" in2="SourceAlpha" operator="in" result="specOut" />
```

{{SVGElement('feComposite')}} đầu tiên nhận `in` là "specOut" và "SourceAlpha", che phần kết quả của "specOut" sao cho nó không lớn hơn "SourceAlpha" (đồ họa nguồn ban đầu), và ghi đè `result` là "specOut".

### Bước 5

```html
<feComposite
  in="SourceGraphic"
  in2="specOut"
  operator="arithmetic"
  k1="0"
  k2="1"
  k3="1"
  k4="0"
  result="litPaint" />
```

{{SVGElement('feComposite')}} thứ hai nhận `in` là "SourceGraphic" và "specOut", thêm kết quả của "specOut" lên trên "SourceGraphic", và lưu `result` vào "litPaint".

### Bước 6

```html
<feMerge>
  <feMergeNode in="offsetBlur" />
  <feMergeNode in="litPaint" />
</feMerge>
```

Cuối cùng, {{SVGElement('feMerge')}} ghép "offsetBlur", tức bóng đổ, và "litPaint", tức đồ họa nguồn ban đầu với hiệu ứng ánh sáng, lại với nhau.

![Đồ họa nguồn](filters01-0.png)

Đồ họa nguồn

![Primitive 1](filters01-1.png)

Primitive 1

![Primitive 2](filters01-2.png)

Primitive 2

![Primitive 3](filters01-3.png)

Primitive 3

![Primitive 4](filters01-4.png)

Primitive 4

![Primitive 5](filters01-5.png)

Primitive 5

![Primitive 6](filters01-6.png)

Primitive 6

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG", "Web/SVG/Tutorials/SVG_from_scratch/Using_fonts") }}
