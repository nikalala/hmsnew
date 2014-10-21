(function( jQuery, undefined ) {

var _remove = jQuery.fn.remove;
jQuery.fn.remove = function( selector, keepData ) {
	
	return this.each(function() {
		if ( !keepData ) {
			if ( !selector || jQuery.filter( selector, [ this ] ).length ) {
				jQuery( "*", this ).add( [ this ] ).each(function() {
					jQuery( this ).triggerHandler( "remove" );
				});
			}
		}
		return _remove.call( jQuery(this), selector, keepData );
	});
};

jQuery.widget = function( name, base, prototype ) {
	var namespace = name.split( "." )[ 0 ],
		fullName;
	name = name.split( "." )[ 1 ];
	fullName = namespace + "-" + name;

	if ( !prototype ) {
		prototype = base;
		base = jQuery.Widget;
	}

	// create selector for plugin
	jQuery.expr[ ":" ][ fullName ] = function( elem ) {
		return !!jQuery.data( elem, name );
	};

	jQuery[ namespace ] = jQuery[ namespace ] || {};
	jQuery[ namespace ][ name ] = function( options, element ) {
		// allow instantiation without initializing for simple inheritance
		if ( arguments.length ) {
			this._createWidget( options, element );
		}
	};

	var basePrototype = new base();
	basePrototype.options = jQuery.extend( true, {}, basePrototype.options );
	jQuery[ namespace ][ name ].prototype = jQuery.extend( true, basePrototype, {
		namespace: namespace,
		widgetName: name,
		widgetEventPrefix: jQuery[ namespace ][ name ].prototype.widgetEventPrefix || name,
		widgetBaseClass: fullName
	}, prototype );

	jQuery.widget.bridge( name, jQuery[ namespace ][ name ] );
};

jQuery.widget.bridge = function( name, object ) {
	jQuery.fn[ name ] = function( options ) {
		var isMethodCall = typeof options === "string",
			args = Array.prototype.slice.call( arguments, 1 ),
			returnValue = this;

		// allow multiple hashes to be passed on init
		options = !isMethodCall && args.length ?
			jQuery.extend.apply( null, [ true, options ].concat(args) ) :
			options;

		// prevent calls to internal methods
		if ( isMethodCall && options.substring( 0, 1 ) === "_" ) {
			return returnValue;
		}

		if ( isMethodCall ) {
			this.each(function() {
				var instance = jQuery.data( this, name ),
					methodValue = instance && jQuery.isFunction( instance[options] ) ?
						instance[ options ].apply( instance, args ) :
						instance;
				if ( methodValue !== instance && methodValue !== undefined ) {
					returnValue = methodValue;
					return false;
				}
			});
		} else {
			this.each(function() {
				var instance = jQuery.data( this, name );
				if ( instance ) {
					if ( options ) {
						instance.option( options );
					}
					instance._init();
				} else {
					jQuery.data( this, name, new object( options, this ) );
				}
			});
		}

		return returnValue;
	};
};

jQuery.Widget = function( options, element ) {
	// allow instantiation without initializing for simple inheritance
	if ( arguments.length ) {
		this._createWidget( options, element );
	}
};

jQuery.Widget.prototype = {
	widgetName: "widget",
	widgetEventPrefix: "",
	options: {
		disabled: false
	},
	_createWidget: function( options, element ) {
		// jQuery.widget.bridge stores the plugin instance, but we do it anyway
		// so that it's stored even before the _create function runs
		jQuery.data( element, this.widgetName, this );
		this.element = jQuery( element );
		this.options = jQuery.extend( true, {},
			this.options,
			jQuery.metadata && jQuery.metadata.get( element )[ this.widgetName ],
			options );

		var self = this;
		this.element.bind( "remove." + this.widgetName, function() {
			self.destroy();
		});

		this._create();
		this._init();
	},
	_create: function() {},
	_init: function() {},

	destroy: function() {
		this.element
			.unbind( "." + this.widgetName )
			.removeData( this.widgetName );
		this.widget()
			.unbind( "." + this.widgetName )
			.removeAttr( "aria-disabled" )
			.removeClass(
				this.widgetBaseClass + "-disabled " +
				"ui-state-disabled" );
	},

	widget: function() {
		return this.element;
	},

	option: function( key, value ) {
		var options = key,
			self = this;

		if ( arguments.length === 0 ) {
			// don't return a reference to the internal hash
			return jQuery.extend( {}, self.options );
		}

		if  (typeof key === "string" ) {
			if ( value === undefined ) {
				return this.options[ key ];
			}
			options = {};
			options[ key ] = value;
		}

		jQuery.each( options, function( key, value ) {
			self._setOption( key, value );
		});

		return self;
	},
	_setOption: function( key, value ) {
		this.options[ key ] = value;

		if ( key === "disabled" ) {
			this.widget()
				[ value ? "addClass" : "removeClass"](
					this.widgetBaseClass + "-disabled" + " " +
					"ui-state-disabled" )
				.attr( "aria-disabled", value );
		}

		return this;
	},

	enable: function() {
		return this._setOption( "disabled", false );
	},
	disable: function() {
		return this._setOption( "disabled", true );
	},

	_trigger: function( type, event, data ) {
		var callback = this.options[ type ];

		event = jQuery.Event( event );
		event.type = ( type === this.widgetEventPrefix ?
			type :
			this.widgetEventPrefix + type ).toLowerCase();
		data = data || {};

		// copy original event properties over to the new event
		// this would happen if we could call jQuery.event.fix instead of jQuery.Event
		// but we don't have a way to force an event to be fixed multiple times
		if ( event.originalEvent ) {
			for ( var i = jQuery.event.props.length, prop; i; ) {
				prop = jQuery.event.props[ --i ];
				event[ prop ] = event.originalEvent[ prop ];
			}
		}

		this.element.trigger( event, data );

		return !( jQuery.isFunction(callback) &&
			callback.call( this.element[0], event, data ) === false ||
			event.isDefaultPrevented() );
	}
};

})( jQuery );
