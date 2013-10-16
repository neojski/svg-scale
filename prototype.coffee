class SvgElement
  getInternal: (name) ->
    @['_' + name]
  processAttr: (name, value) ->
    if value?
      console.log "setting #{name}"
      @['_' + name] = 5 * value
    else
      console.log "getting #{name}"
      @['_' + name] / 5
  @create: (opt) ->
    klass = class Element extends SvgElement
    opt.attrs.forEach (name) ->
      console.log 'define', name
      Object.defineProperty klass::, name,
        set: (value) ->
          @processAttr(name, value)
        get: ->
          @processAttr(name)
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

circle.cx = 5
console.log circle.cx

console.log circle.getInternal('cx')

###
question:

should the object always depend on the svg element?

I think that's true. Since we always have to know what's the current scale and
the svg element knows this.
###