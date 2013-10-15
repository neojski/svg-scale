class SvgElement
  processAttr: (name, value) ->
    if value?
      console.log "setting #{name}"
      this['_' + name] = value
    else
      console.log "getting #{name}"
      this['_' + name]
  @create: (opt) ->
    klass = class Element extends SvgElement
    opt.attrs.forEach (name) ->
      klass::[name] = (value) ->
        @processAttr(name, value)
    klass

Circle = SvgElement.create(
  attrs: [
    'cx'
    'cy'
    'r'
  ]
)

element = null;
circle = new Circle(element)

# or maybe use getter/setter? = easier syntax
circle.cx(1)
circle.cy(2)
circle.r(3)

console.log circle.cx()
console.log circle.cy()
console.log circle.r()

###
question:

should the object always depend on the svg element?

I think that's true. Since we always have to know what's the current scale and
the svg element knows this.
###