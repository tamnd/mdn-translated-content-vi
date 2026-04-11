---
title: Dữ liệu trong WebGL
slug: Web/API/WebGL_API/Data
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

Các chương trình shader có quyền truy cập vào ba kiểu kho dữ liệu, mỗi kiểu có một trường hợp sử dụng cụ thể. Mỗi kiểu biến có thể truy cập được bởi một hoặc cả hai loại chương trình shader (tùy theo kiểu kho dữ liệu) và có thể bởi mã JavaScript của trang, tùy vào kiểu biến cụ thể.

## Các kiểu dữ liệu GLSL

Xem [Data Types](<https://wikis.khronos.org/opengl/Data_Type_(GLSL)>) trong tài liệu GLSL.

## Các biến GLSL

Có ba kiểu "biến" hoặc kho dữ liệu sẵn có trong GLSL, mỗi kiểu có mục đích và trường hợp sử dụng riêng: **[attributes](#attributes)**, **[varyings](#varyings)** và **[uniforms](#uniforms)**.

### Attributes

**Attributes** là các biến GLSL chỉ có sẵn cho vertex shader (dưới dạng biến) và mã JavaScript. Attributes thường được dùng để lưu thông tin màu sắc, tọa độ texture và bất kỳ dữ liệu nào khác đã tính toán hoặc truy xuất cần được chia sẻ giữa mã JavaScript và vertex shader.

```js
// init colors
const vertexColors = [
  vec4(0.0, 0.0, 0.0, 1.0), // black
  vec4(1.0, 0.0, 0.0, 1.0), // red
  vec4(1.0, 1.0, 0.0, 1.0), // yellow
  vec4(0.0, 1.0, 0.0, 1.0), // green
  vec4(0.0, 0.0, 0.0, 1.0), // black
  vec4(1.0, 0.0, 0.0, 1.0), // red
  vec4(1.0, 1.0, 0.0, 1.0), // yellow
  vec4(0.0, 1.0, 0.0, 1.0), // green
];
const cBuffer = gl.createBuffer();
```

```js
// continued
// create buffer to store colors and reference it to "vColor" which is in GLSL
gl.bindBuffer(gl.ARRAY_BUFFER, cBuffer);
gl.bufferData(gl.ARRAY_BUFFER, flatten(vertexColors), gl.STATIC_DRAW);

const vColor = gl.getAttribLocation(program, "vColor");
gl.vertexAttribPointer(vColor, 4, gl.FLOAT, false, 0, 0);
gl.enableVertexAttribArray(vColor);
```

```glsl
attribute  vec4 vColor;

void main()
{
  fColor = vColor;
}
```

### Varyings

**Varyings** là các biến được khai báo bởi vertex shader và dùng để truyền dữ liệu từ vertex shader sang fragment shader. Cách này thường được dùng để chia sẻ [vector pháp tuyến](<https://en.wikipedia.org/wiki/Normal_(geometry)>) của một đỉnh sau khi nó đã được vertex shader tính toán.

<\<how to use>>

### Uniforms

**Uniforms** được thiết lập bởi mã JavaScript và có sẵn cho cả vertex shader lẫn fragment shader. Chúng được dùng để cung cấp các giá trị sẽ giống nhau cho mọi thứ được vẽ trong khung hình, chẳng hạn như vị trí và cường độ chiếu sáng, thông tin biến đổi toàn cục và phối cảnh, v.v.

<\<add details>>

## Buffers

<\<add information>>

## Textures

<\<add information>>
