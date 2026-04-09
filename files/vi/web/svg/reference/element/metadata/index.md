---
title: <metadata>
slug: Web/SVG/Reference/Element/metadata
page-type: svg-element
browser-compat: svg.elements.metadata
sidebar: svgref
---

Phần tử **`<metadata>`** của [SVG](/en-US/docs/Web/SVG) thêm metadata vào nội dung SVG. Metadata là thông tin có cấu trúc về dữ liệu. Nội dung của `<metadata>` nên là các phần tử từ các {{Glossary("XML")}} {{Glossary("namespace", "namespace")}} khác như {{Glossary("RDF")}}, [FOAF](<https://en.wikipedia.org/wiki/FOAF_(ontology)>), v.v.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

Phần tử này chỉ bao gồm các thuộc tính toàn cục.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGMetadataElement")}}.

## Ví dụ

```html
<svg
  width="400"
  viewBox="0 0 400 300"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <metadata>
    <rdf:RDF
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:connect="http://www.w3.org/1999/08/29-svg-connections-in-RDF#">
      <rdf:Description about="#CableA">
        <connect:ends rdf:resource="#socket1" />
        <connect:ends rdf:resource="#ComputerA" />
      </rdf:Description>
      <rdf:Description about="#CableB">
        <connect:ends rdf:resource="#socket2" />
        <connect:ends rdf:resource="#ComputerB" />
      </rdf:Description>
      <rdf:Description about="#CableN">
        <connect:ends rdf:resource="#socket5" />
        <connect:ends>Everything</connect:ends>
      </rdf:Description>
      <rdf:Description about="#Hub">
        <connect:ends rdf:resource="#socket1" />
        <connect:ends rdf:resource="#socket2" />
        <connect:ends rdf:resource="#socket3" />
        <connect:ends rdf:resource="#socket4" />
        <connect:ends rdf:resource="#socket5" />
      </rdf:Description>
    </rdf:RDF>
  </metadata>
  <title>Mạng</title>
  <desc>Một ví dụ về mạng máy tính dựa trên một hub.</desc>

  <style>
    svg {
      /* Kiểu mặc định sẽ được kế thừa */
      fill: white;
      stroke: black;
    }
    text {
      fill: black;
      stroke: none;
    }
    path {
      fill: none;
    }
  </style>

  <!-- Xác định các symbol được dùng trong SVG -->
  <defs>
    <!-- symbol hubPlug. Được dùng bởi symbol hub -->
    <symbol id="hubPlug">
      <desc>Một socket 10BaseT/100baseTX</desc>
      <path d="M0,10 h5 v-9 h12 v9 h5 v16 h-22 z" />
    </symbol>

    <!-- symbol hub -->
    <symbol id="hub">
      <desc>Một hub mạng 10BaseT/100BaseTX điển hình</desc>
      <text x="0" y="15">Hub</text>
      <g transform="translate(0 20)">
        <rect width="253" height="84" />
        <rect width="229" height="44" x="12" y="10" />
        <circle fill="red" cx="227" cy="71" r="7" />
        <!-- năm nhóm, mỗi nhóm dùng socket đã định nghĩa -->
        <g id="sock1et" transform="translate(25 20)">
          <title>Socket 1</title>
          <use href="#hubPlug" />
        </g>
        <g id="socket2" transform="translate(70 20)">
          <title>Socket 2</title>
          <use href="#hubPlug" />
        </g>
        <g id="socket3" transform="translate(115 20)">
          <title>Socket 3</title>
          <use href="#hubPlug" />
        </g>
        <g id="socket4" transform="translate(160 20)">
          <title>Socket 4</title>
          <use href="#hubPlug" />
        </g>
        <g id="socket5" transform="translate(205 20)">
          <title>Socket 5</title>
          <use href="#hubPlug" />
        </g>
      </g>
    </symbol>

    <!-- symbol computer -->
    <symbol id="computer">
      <desc>Một máy tính để bàn thông thường</desc>
      <g id="monitorStand" transform="translate(40 121)">
        <title>Giá đỡ màn hình</title>
        <desc>
          Một trong những giá đỡ màn hình xoay được đặt bên dưới màn hình
        </desc>
        <path d="m0,0 S 10 10 40 12" />
        <path d="m80,0 S 70 10 40 12" />
        <path d="m0,20 L 10 10 S 40 12 70 10 L 80 20z" />
      </g>
      <g id="monitor">
        <title>Màn hình</title>
        <desc>Một màn hình rất xịn</desc>
        <rect width="160" height="120" />
        <rect fill="lightgrey" width="138" height="95" x="11" y="12" />
      </g>
      <g id="processor" transform="translate(0 142)">
        <title>Máy tính</title>
        <desc>Một máy tính để bàn - kiểu hộp dẹt rộng</desc>
        <rect width="160" height="60" />
        <g id="discDrive" transform="translate(70 8)">
          <title>Ổ đĩa</title>
          <desc>Một ổ đĩa tích hợp</desc>
          <rect width="58" height="3" x="12" y="8" />
          <rect width="8" height="2" x="12" y="15" />
        </g>
        <circle cx="135" cy="40" r="5" />
      </g>
    </symbol>
  </defs>

  <text x="0" y="15">Mạng</text>

  <!-- Dùng symbol hub. -->
  <g id="Hub" transform="translate(80 45)">
    <title>Hub</title>
    <use href="#hub" transform="scale(0.75)" />
  </g>

  <!-- Dùng symbol computer. -->
  <g id="ComputerA" transform="translate(20 170)">
    <title>Máy tính A</title>
    <use href="#computer" transform="scale(0.5)" />
  </g>

  <!-- Dùng cùng symbol computer. -->
  <g id="ComputerB" transform="translate(300 170)">
    <title>Máy tính B</title>
    <use href="#computer" transform="scale(0.5)" />
  </g>

  <!-- Vẽ Cable A. -->
  <g id="CableA" transform="translate(107 88)">
    <title>Cáp A</title>
    <desc>Cáp xoắn đôi 10BaseT</desc>
    <path d="M0,0c100,140 50,140 -8,160" />
  </g>

  <!-- Vẽ Cable B. -->
  <g id="CableB" transform="translate(142 88)">
    <title>Cáp B</title>
    <desc>Cáp xoắn đôi 10BaseT</desc>
    <path d="M0,0c100,180 110,160 159,160" />
  </g>

  <!-- Vẽ Cable N. -->
  <g id="CableN" transform="translate(242 88)">
    <title>Cáp N</title>
    <desc>Cáp xoắn đôi 10BaseT</desc>
    <path d="M0,0c0,-70 20,-50 60,-50" />
  </g>
</svg>
```

{{EmbedLiveSample('Example', '100%', 300)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
