---
title: "Window: sự kiện vrdisplaypresentchange"
short-title: vrdisplaypresentchange
slug: Web/API/Window/vrdisplaypresentchange_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.Window.vrdisplaypresentchange_event
---

{{APIRef("Window")}}{{Deprecated_Header}}{{Non-standard_Header}}

The **`vrdisplaypresentchange`** event of the [WebVR API](/en-US/docs/Web/API/WebVR_API) is fired when the presenting state of a VR display changes — i.e., goes from presenting to not presenting, or vice versa.

> [!NOTE]
> This event was part of the old [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/). It has been superseded by the [WebXR Device API](https://immersive-web.github.io/webxr/).

This event is not cancelable and does not bubble.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("vrdisplaypresentchange", (event) => { })

onvrdisplaypresentchange = (event) => { }
```

## Kiểu sự kiện

A {{domxref("VRDisplayEvent")}}. Inherits from {{domxref("Event")}}.

{{InheritanceDiagram("VRDisplayEvent")}}

## Event properties

_`VRDisplayEvent` also inherits properties from its parent object, {{domxref("Event")}}._

- {{domxref("VRDisplayEvent.display")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : The {{domxref("VRDisplay")}} associated with this event.
- {{domxref("VRDisplayEvent.reason")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : A human-readable reason why the event was fired.

## Ví dụ

You can use the `vrdisplaypresentchange` event in an [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener) method:

```js
window.addEventListener("vrdisplaypresentchange", () => {
  info.textContent = vrDisplay.isPresenting
    ? "Display has started presenting."
    : "Display has stopped presenting.";
  reportDisplays();
});
```

Or use the `onvrdisplaypresentchange` event handler property:

```js
window.onvrdisplaypresentchange = () => {
  info.textContent = vrDisplay.isPresenting
    ? "Display has started presenting."
    : "Display has stopped presenting.";
  reportDisplays();
};
```

## Đặc tả kỹ thuật

This event was part of the old [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) that has been superseded by the [WebXR Device API](https://immersive-web.github.io/webxr/). It is no longer on track to becoming a standard.

Until all browsers have implemented the new [WebXR Device API](https://immersive-web.github.io/webxr/), it is recommended to rely on frameworks, like [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), or [Three.js](https://threejs.org/), or a [polyfill](https://github.com/immersive-web/webxr-polyfill), to develop WebXR applications that will work across all browsers. Read [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) guide for more information.

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
