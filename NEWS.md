
osmplotr v0.3.3.X (dev)
===============

Minor changes
-------

- Replace now obsolete 'spatstat.core' to 'spatstat.explore' dependency


osmplotr v0.3.3
===============

Minor changes
-------
- Changes in response to `spatstat` v2 updates

Minor changes
-------
- 'add_osm_surface' functions changed to directly calculate and plot colours of
  objects, rather than rely on `ggplot2::scale_fill_gradientn`.

osmplotr v0.3.2
===============

Minor changes
-------
* 'verbose' parameter of 'extract_osm_objects' renamed to 'quiet'

osmplotr v0.3.1
===============

Major changes
-------
* New function 'osm_line2poly' enables plotting polygonal shapes delineated only
  by lines, through tracing around the bounding box to form full polygons.
* New vignette to describe this functionality, "maps-with-ocean".

Minor changes
-------
* 'osm_basemap' now accepts an 'sf' object instead of explicit 'bbox' values,
  and extracts the corresponding 'bbox' directly from that object.


osmplotr v0.3.0
===============

Major changes
-------
* Major re-structure to use 'osmdata' package instead of 'osmar', with
  concomitantly enormous increase in speed of 'extract_osm_objects'
* Package is now also 'sf'-compatible: objects to be plotted can be either 'sp'
  or 'sf' format, with all 'osmplotr' functions defaulting to 'sf'

Minor changes
-------
* Title in DESCRIPTION changed from "Customisable Images of OpenStreetMap Data"
  to "Bespoke Images of 'OpenStreetMap' Data"
* Better control of timeout errors when calling the overpass API
* Git host transferred from ropenscilabs to ropensci
* Acknowledge OSM contributors on startup
* Rename 'borderWidth' parameter of 'add_osm_groups' to 'border_width'
* 'connect_highways' also entirely re-coded to be much more efficient, but
  this should not affect functionality at all.

osmplotr v0.2.3
===============

* add 'return_type' argument to 'extract_osm_objects' to enable explicit
  specification of return type (points, lines, polygons)
* fix tests so they pass even if download fails

osmplotr v0.2.2
===============

* 'add_osm_surface' did not previously work properly for different bboxes
    (and so zooming was not possible). Now fixed.
* both 'add_osm_surface' and 'add_osm_groups' now enable maps to be zoomed
* fix make_osm_map to produce maps even when not all requested data exists

osmplotr v0.2.1
===============

* vignette 'making-maps' renamed 'basic-maps' and tidied
* vignette 'making-maps-with-data' renamed 'data-maps' and tidied
* 'plot_osm_basemap' renamed 'osm_basemap', and now uses
    'ggplot2::coord_equal()' to ensure maps are scaled to bounding boxes.
* 'print_osm_map' added to enable device proportions to be automatically scaled
    to bounding boxes.
* manual entries cleaned up to remove non-exported functions

osmplotr v0.2.0
===============

Major update with (almost) all plotting routines shifted from 'graphics::plot'
to 'ggplot2'. All previous parameters specifying graphics devices (such as
heights and widths) no longer apply.

Changes:

* vignette 'downloading-data' removed (incorporate in 'making-maps')
* vignette 'making-maps' extended
* vignette 'making-maps-with-data' added
* Extensive examples added to most functions
* 'click_map' removed
* 'connect_highways' renamed 'get_highway_cycle'
* 'highways2polygon' renamed 'connect_highways'
* 'extract_highway', 'extract_highways', 'order_lines' no longer exported
* 'extract_osm_objects' now just returns objects (instead of '$obj' and
    '$warn'), and dumps warnings direct to screen.
* 'add_osm_groups' now accepts lists of simple spatial points as groups
* Coordinate reference system properly attributed to all objects
* many tests added
* Change to 'ggplot2' has considerably changed structure of many functions. For
  details see function examples and vignettes


osmplotr v0.1-3
===============

Changes:

* added 'add_axes' to plot lat-lon axes
* added 'add_osm_surface' to spatially interpolate continuous surfaces from
user-defined data
* added 'add_colourbar' to plot a colourbar legend for 'add_osm_surface'
* renamed 'group_osm_objects' to 'add_osm_groups' 
* added 'adjust_colours' to allow colours to be lightened or darkened
* all usages of 'xylims' (vectors of four components) and 'get_xylims' changed
to 'bbox' (2-by-2 matrices) for consistency with sp and tmap
* reduce size of 'london' data (through smaller bbox), with corresponding
changes in vignettes

osmplotr v0.1-1, 0.1-2
=================

Published on CRAN
