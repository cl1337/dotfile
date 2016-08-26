
class MBR(object):
    """MBR: Minimum Bounding Region for a list of geo-objects,
    In maps data we only care 2D range.
    """
    def __init__(self):
        self.x_min = None
        self.x_max = None
        self.y_min = None
        self.y_max = None

    def construct_MBR_from_obj_list(self, obj_list):
        """Given a list of geo-objects (polygons, routes, points),
        set x range and y range"""
        pass

    def overlap(self, MBR_obj):
        """Rectangle overlapping"""
        pass


class RTreeNode(object):

    def __init__(self):
        self.MBR = None
        self.child_pointers = None  # set if it's not leaf node
        self.obj_uuid = None  # set if this is a leaf node


class RTree(object):

    def __init__(self):
        self.root = None

    def construct_RTree_from_obj_list(self, obj_list):
        """Bottom up fasion to set self.root."""
        pass

    def region_search(self, query_MBR):
        query_results = []
        BFS_queue = [self.root]

        while len(BFS_queue):
            node = BFS_queue.pop()

            if node.obj_uuid:
                # if node is a leaf object, found one POI in query MBR
                # push to query result
                query_results.append(node)
            elif node.MBR.overlap(query_MBR):
                # if node's MBR is overlapping with query MBR, dig further
                # into next layer, push all child nodes into BFS queue
                for child_node in node.child_pointers:
                    BFS_queue.append(child_node)

        return query_results
