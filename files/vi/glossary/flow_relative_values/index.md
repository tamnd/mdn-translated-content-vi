---
title: Giá trị tương đối theo luồng
slug: Glossary/Flow_relative_values
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, **giá trị tương đối theo luồng** (flow relative values) là các giá trị từ khóa hướng tương đối theo các trục block và inline của phần tử. Các giá trị này bao gồm `block-start`, `block-end`, `inline-start`, `inline-end`, `start` và `end`.

Trong CSS, {{glossary("physical properties")}} định nghĩa các vị trí dựa trên hướng vật lý và tham chiếu đến các cạnh cụ thể của phần tử.

Ngược lại, {{glossary("logical properties")}} CSS định nghĩa các kiểu dáng dựa trên chế độ viết và hướng của tài liệu thay vì các kích thước vật lý của khung nhìn. Các thuộc tính logic tương đối với luồng nội dung và sử dụng các từ khóa hướng tương đối với các trục block và inline.

## Hướng block

**Trục block** đề cập đến trục xác định thứ tự xếp chồng của các phần tử trong bố cục khối. Về cơ bản, đây là hướng mà các khối nội dung — như đoạn văn ({{htmlelement("p")}}), tiêu đề và div ({{htmlelement("div")}}) — được bố trí trên trang web. Điều này còn được gọi là **hướng block**. Trong các ngôn ngữ viết từ trái sang phải và từ phải sang trái, hướng block là hướng dọc của luồng nội dung, đi từ trên xuống dưới.

Hướng **block-start** và **block-end** đại diện cho _cạnh bắt đầu_ và _cạnh kết thúc_ của nội dung dọc theo trục block, hoặc là hướng "từ" và "đến", tương ứng, với `block-start` tương đương với `top` và `block-end` tương đương với `bottom` trong các chế độ viết ngang.

## Hướng inline

**Trục inline** vuông góc với trục block. Trục inline đại diện cho hướng mà nội dung nội tuyến như văn bản chảy trong một khối. Điều này còn được gọi là **hướng inline**. Trong các chế độ viết từ trái sang phải, như tiếng Anh, hướng inline là ngang, từ trái sang phải. Trong các ngôn ngữ từ phải sang trái, như tiếng Ả Rập và tiếng Do Thái, hướng inline là ngang, từ phải sang trái.

**Inline-start** và **inline-end** đại diện cho _cạnh bắt đầu_ và _cạnh kết thúc_ của nội dung dọc theo trục inline, tương ứng, với các giá trị và thuộc tính `inline-start` và `inline-end` tương đương với các thuộc tính và giá trị `left` và `right` trong các chế độ viết ngang. Việc chúng tương đương với `right` hay `left` phụ thuộc vào hướng viết. Ví dụ, `inline-start` tương đương với `left` trong các ngôn ngữ từ trái sang phải và `right` trong các ngôn ngữ từ phải sang trái.

## Start và end

Hiệu ứng của một thuộc tính CSS có thể là một chiều hoặc hai chiều. Ví dụ, {{cssxref("text-align")}} chỉ liên quan đến hướng inline của văn bản, do đó là một chiều. Khi bị ràng buộc theo ngữ cảnh vào một chiều, các từ khóa tương đối theo luồng được rút gọn thành chỉ `start` hoặc `end`.

## Xem thêm

- [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) module
- [Các khái niệm cơ bản về thuộc tính và giá trị logic](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts)
